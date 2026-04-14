`ifndef RAM_SEQUENCE_SV
`define RAM_SEQUENCE_SV


`include "uvm_macros.svh"
`include "ram_seq_item.sv"
import uvm_pkg::*;

class ram_random_sequence extends uvm_sequence #(ram_seq_item);
    `uvm_object_utils(ram_random_sequence)
    int num_transaction = 0;

    function new(string name = "ram_random_sequence");
        super.new(name);
    endfunction

    virtual task body();
        ram_seq_item item;

        repeat (num_transaction) begin
            item = ram_seq_item::type_id::create("item");
            start_item(item);
            if (!item.randomize()) begin
                `uvm_fatal(get_type_name(), "Randomization Failed!");
            end
            finish_item(item);
        end

        // 코너케이스 wdata = 0x0000
        item = ram_seq_item::type_id::create("item");
        start_item(item);
        item.randomize() with {wr == 1; wdata == 16'h0000;};
        finish_item(item);

        // 코너케이스 wdata = 0xFFFF
        item = ram_seq_item::type_id::create("item");
        start_item(item);
        item.randomize() with {wr == 1; wdata == 16'hFFFF;};
        finish_item(item);
    endtask
endclass

class ram_write_read_sequence extends uvm_sequence #(ram_seq_item);
    `uvm_object_utils(ram_write_read_sequence)
    int num_transaction = 0;

    function new(string name = "ram_write_read_sequence");
        super.new(name);
    endfunction

    virtual task body();
        ram_seq_item item;

        repeat (num_transaction) begin
            item = ram_seq_item::type_id::create("item");
            start_item(item);
            if (!item.randomize() with {wr == 1;}) begin
                `uvm_fatal(get_type_name(), "Randomization Failed!");
            end
            finish_item(item);

            start_item(item);
            item.wr = 0;
            finish_item(item);
        end

        // 코너케이스 wdata = 0x0000
        item = ram_seq_item::type_id::create("item");
        start_item(item);
        item.randomize() with {wr == 1; wdata == 16'h0000;};
        finish_item(item);
        start_item(item);
        item.wr = 0;
        finish_item(item);

        // 코너케이스 wdata = 0xFFFF
        item = ram_seq_item::type_id::create("item");
        start_item(item);
        item.randomize() with {wr == 1; wdata == 16'hFFFF;};
        finish_item(item);
        start_item(item);
        item.wr = 0;
        finish_item(item);

    endtask
endclass

class ram_full_sweep_sequence extends uvm_sequence #(ram_seq_item);
    `uvm_object_utils(ram_full_sweep_sequence)
    int num_transaction = 0;

    function new(string name = "ram_full_sweep_sequence");
        super.new(name);
    endfunction

    virtual task body();

        ram_seq_item item = ram_seq_item::type_id::create("item");

        for (int i = 0; i < 2 ** 8; i++) begin
            start_item(item);
            item.randomize() with {
                wr == 1;
                addr == i;
            };
            finish_item(item);
        end

        for (int i = 0; i < 2 ** 8; i++) begin
            start_item(item);
            item.wr   = 0;
            item.addr = i;
            finish_item(item);
        end

        // 코너케이스 wdata = 0x0000
        item = ram_seq_item::type_id::create("item");
        start_item(item);
        item.randomize() with {wr == 1; wdata == 16'h0000;};
        finish_item(item);

        start_item(item);
        item.wr = 0;
        finish_item(item);
    endtask
endclass

`endif

