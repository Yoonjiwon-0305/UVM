`ifndef UART_TEST_SV
`define UART_TEST_SV

class uart_base_test extends uvm_test;
    `uvm_component_utils(uart_base_test)

    uart_env env;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = uart_env::type_id::create("env", this);
    endfunction

endclass

class uart_random_test extends uart_base_test;
    `uvm_component_utils(uart_random_test)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual task run_phase(uvm_phase phase);
        uart_random_sequence seq = uart_random_sequence::type_id::create("seq");
        phase.raise_objection(this);
        seq.num_transaction = 50;
        seq.start(env.agt.sqr);
        phase.drop_objection(this);
    endtask

endclass

class uart_sweep_test extends uart_base_test;
    `uvm_component_utils(uart_sweep_test)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual task run_phase(uvm_phase phase);
        uart_sweep_sequence seq = uart_sweep_sequence::type_id::create("seq");
        phase.raise_objection(this);
        seq.start(env.agt.sqr);
        phase.drop_objection(this);
    endtask

endclass

`endif