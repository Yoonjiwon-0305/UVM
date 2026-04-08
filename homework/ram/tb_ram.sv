`include "uvm_macros.svh"
import uvm_pkg::*;

interface ram_if (
    input logic clk
);
    logic        reset_n;
    logic        write;
    logic [ 7:0] addr;
    logic [15:0] wdata;
    logic [15:0] rdata;
endinterface

class ram_seq_item extends uvm_sequence_item;
    rand bit        reset_n;
    rand bit        write;
    rand bit [ 7:0] addr;
    rand bit [15:0] wdata;
    logic    [15:0] rdata;

    constraint c_addr  {addr inside {[8'h00 : 8'h0F]};}
    constraint c_write {
        write dist {
            1 := 7,
            0 := 3
        };
    }

    `uvm_object_utils_begin(ram_seq_item)
        `uvm_field_int(reset_n, UVM_ALL_ON)
        `uvm_field_int(write,   UVM_ALL_ON)
        `uvm_field_int(addr,    UVM_ALL_ON)
        `uvm_field_int(wdata,   UVM_ALL_ON)
        `uvm_field_int(rdata,   UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "ram_seq_item");
        super.new(name);
    endfunction

    function string conver2string();
        return $sformatf("reset_n=%0b write=%0b addr=%0h wdata=%0h rdata=%0h",
                         reset_n, write, addr, wdata, rdata);
    endfunction
endclass

class ram_reset_seq extends uvm_sequence #(ram_seq_item);
    `uvm_object_utils(ram_reset_seq)

    function new(string name = "ram_reset_seq");
        super.new(name);
    endfunction

    virtual task body();
        ram_seq_item item;
        item = ram_seq_item::type_id::create("item");

        start_item(item);
        item.reset_n = 0;
        item.write   = 0;
        item.addr    = 0;
        item.wdata   = 0;
        finish_item(item);

        `uvm_info(get_type_name(), "Reset Done!", UVM_MEDIUM)
    endtask
endclass

class ram_write_seq extends uvm_sequence #(ram_seq_item);
    `uvm_object_utils(ram_write_seq)
    int num_transactions;

    function new(string name = "ram_write_seq");
        super.new(name);
        num_transactions = 0;
    endfunction

    virtual task body();
        ram_seq_item item;
        for (int i = 0; i < num_transactions; i++) begin
            item = ram_seq_item::type_id::create($sformatf("item_%0d", i));

            start_item(item);
            if (!item.randomize() with {reset_n == 1; write == 1;})
                `uvm_fatal(get_type_name(), "Randomization failed!")
            finish_item(item);

            `uvm_info(get_type_name(), $sformatf(
                      "[%0d/%0d] %s", i+1, num_transactions, item.conver2string()),
                      UVM_HIGH)
        end
    endtask
endclass

class ram_read_seq extends uvm_sequence #(ram_seq_item);
    `uvm_object_utils(ram_read_seq)
    int num_transactions;

    function new(string name = "ram_read_seq");
        super.new(name);
        num_transactions = 0;
    endfunction

    virtual task body();
        ram_seq_item item;
        for (int i = 0; i < num_transactions; i++) begin
            item = ram_seq_item::type_id::create($sformatf("item_%0d", i));

            start_item(item);
            if (!item.randomize() with {reset_n == 1; write == 0;})
                `uvm_fatal(get_type_name(), "Randomization failed!")
            finish_item(item);

            `uvm_info(get_type_name(), $sformatf(
                      "[%0d/%0d] %s", i+1, num_transactions, item.conver2string()),
                      UVM_HIGH)
        end
    endtask
endclass

class ram_master_seq extends uvm_sequence #(ram_seq_item);
    `uvm_object_utils(ram_master_seq)

    function new(string name = "ram_master_seq");
        super.new(name);
    endfunction

    virtual task body();
        ram_reset_seq reset_seq;
        ram_write_seq write_seq;
        ram_read_seq  read_seq;

        `uvm_info(get_type_name(), "===== Phase 1: Reset =====", UVM_MEDIUM)
        reset_seq = ram_reset_seq::type_id::create("reset_seq");
        reset_seq.start(m_sequencer);

        `uvm_info(get_type_name(), "===== Phase 2: Write =====", UVM_MEDIUM)
        write_seq = ram_write_seq::type_id::create("write_seq");
        write_seq.num_transactions = 5;
        write_seq.start(m_sequencer);

        `uvm_info(get_type_name(), "===== Phase 3: Read =====", UVM_MEDIUM)
        read_seq = ram_read_seq::type_id::create("read_seq");
        read_seq.num_transactions = 5;
        read_seq.start(m_sequencer);

        `uvm_info(get_type_name(), "===== Master Sequence done =====", UVM_MEDIUM)
    endtask
endclass

class ram_driver extends uvm_driver #(ram_seq_item);
    `uvm_component_utils(ram_driver)
    virtual ram_if r_if;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual ram_if)::get(this, "", "r_if", r_if))
            `uvm_fatal(get_type_name(), "r_if를 찾을 수 없습니다!")
        `uvm_info(get_type_name(), "build_phase 실행 완료!", UVM_HIGH)
    endfunction

    virtual task drive_item(ram_seq_item item);
        @(posedge r_if.clk);
        #1;
        r_if.reset_n <= item.reset_n;
        r_if.write   <= item.write;
        r_if.addr    <= item.addr;
        r_if.wdata   <= item.wdata;
        `uvm_info(get_type_name(), item.conver2string(), UVM_MEDIUM)
    endtask

    virtual task run_phase(uvm_phase phase);
        ram_seq_item item;
        forever begin
            seq_item_port.get_next_item(item);
            drive_item(item);
            seq_item_port.item_done();
        end
    endtask
endclass

class ram_monitor extends uvm_monitor;
    `uvm_component_utils(ram_monitor)
    virtual ram_if r_if;

    logic [15:0] mem[0:255] = '{default: 0};

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual ram_if)::get(this, "", "r_if", r_if))
            `uvm_fatal(get_type_name(), "r_if를 찾을 수 없습니다!")
        `uvm_info(get_type_name(), "build_phase 실행 완료!", UVM_HIGH)
    endfunction

    virtual task run_phase(uvm_phase phase);
        `uvm_info(get_type_name(), "run_phase 실행", UVM_DEBUG)

        forever begin
            ram_seq_item item = ram_seq_item::type_id::create("item");
            @(posedge r_if.clk);
            #2;
            item.reset_n = r_if.reset_n;
            item.write   = r_if.write;
            item.addr    = r_if.addr;
            item.wdata   = r_if.wdata;
            item.rdata   = r_if.rdata;

            if (!item.reset_n) begin
                mem = '{default: 0};
                `uvm_info(get_type_name(), "Memory cleared by reset", UVM_MEDIUM)

            end else if (item.write) begin
                mem[item.addr] = item.wdata;
                `uvm_info(get_type_name(), $sformatf(
                          "WRITE: addr=%0h wdata=%0h", item.addr, item.wdata),
                          UVM_MEDIUM)

            end else begin
                @(posedge r_if.clk);
                #2;
                item.rdata = r_if.rdata;

                if (mem[item.addr] !== item.rdata) begin
                    `uvm_error(get_type_name(), $sformatf(
                        "MISMATCH addr=%0h expected=%0h actual=%0h",
                        item.addr, mem[item.addr], item.rdata))
                end else begin
                    // ✅ expected와 actual 둘 다 출력
                    `uvm_info(get_type_name(), $sformatf(
                        "MATCH! addr=%0h expected=%0h actual=%0h",
                        item.addr, mem[item.addr], item.rdata), UVM_LOW)
                end
            end

            `uvm_info(get_type_name(), item.conver2string(), UVM_MEDIUM)
        end
    endtask

    virtual function void report_phase(uvm_phase phase);
        super.report_phase(phase);
    endfunction
endclass

class ram_agent extends uvm_agent;
    `uvm_component_utils(ram_agent)

    uvm_sequencer #(ram_seq_item) sqr;
    ram_driver  drv;
    ram_monitor mon;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        sqr = uvm_sequencer#(ram_seq_item)::type_id::create("sqr", this);
        `uvm_info(get_type_name(), "sqr 생성", UVM_DEBUG)
        drv = ram_driver::type_id::create("drv", this);
        `uvm_info(get_type_name(), "drv 생성", UVM_DEBUG)
        mon = ram_monitor::type_id::create("mon", this);
        `uvm_info(get_type_name(), "mon 생성", UVM_DEBUG)
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        drv.seq_item_port.connect(sqr.seq_item_export);
    endfunction
endclass

class ram_environment extends uvm_component;
    `uvm_component_utils(ram_environment)

    ram_agent agt;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agt = ram_agent::type_id::create("agt", this);
        `uvm_info(get_type_name(), "agt 생성", UVM_DEBUG)
    endfunction
endclass

class ram_test extends uvm_test;
    `uvm_component_utils(ram_test)

    ram_environment env;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = ram_environment::type_id::create("env", this);
        `uvm_info(get_type_name(), "env 생성", UVM_DEBUG)
    endfunction

    virtual task run_phase(uvm_phase phase);
        ram_reset_seq reset_seq;
        ram_write_seq write_seq;
        ram_read_seq  read_seq;

        phase.raise_objection(this);

        reset_seq = ram_reset_seq::type_id::create("reset_seq");
        reset_seq.start(env.agt.sqr);

        write_seq = ram_write_seq::type_id::create("write_seq");
        write_seq.num_transactions = 20;
        write_seq.start(env.agt.sqr);

        read_seq = ram_read_seq::type_id::create("read_seq");
        read_seq.num_transactions = 10;
        read_seq.start(env.agt.sqr);

        #100;
        phase.drop_objection(this);
    endtask

    virtual function void report_phase(uvm_phase phase);
        uvm_report_server svr = uvm_report_server::get_server();
        if (svr.get_severity_count(UVM_ERROR) == 0)
            `uvm_info(get_type_name(), "===== TEST PASS ! =====", UVM_LOW)
        else
            `uvm_info(get_type_name(), "===== TEST FAIL ! =====", UVM_LOW)
        uvm_top.print_topology();
    endfunction
endclass

module tb_ram ();
    logic clk;

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    ram_if r_if (clk);

    ram dut (
        .clk    (clk),
        .reset_n(r_if.reset_n),
        .write  (r_if.write),
        .addr   (r_if.addr),
        .wdata  (r_if.wdata),
        .rdata  (r_if.rdata)
    );

    initial begin
        uvm_config_db#(virtual ram_if)::set(null, "*", "r_if", r_if);
        run_test("ram_test");
    end
endmodule