`ifndef UART_SEQUENCE_SV
`define UART_SEQUENCE_SV

`include "uvm_macros.svh"
`include "uart_seq_item.sv"
import uvm_pkg::*;

//tx_data random test
class uart_random_sequence extends uvm_sequence #(uart_seq_item);
    `uvm_object_utils(uart_random_sequence)
    int num_transaction = 0;

    function new(string name = "uart_random_seq");
        super.new(name);
    endfunction  //new()

    virtual task body();
        repeat (num_transaction) begin
            uart_seq_item item = uart_seq_item::type_id::create("item");

            start_item(item);
            if (!item.randomize()) begin
                `uvm_fatal(get_type_name(), "Randomization Failed!");
            end
            finish_item(item);
        end
    endtask
endclass

class uart_sweep_sequence extends uvm_sequence #(uart_seq_item);
    `uvm_object_utils(uart_sweep_sequence)

    function new(string name = "uart_sweep_sequence");
        super.new(name);
    endfunction

    virtual task body();
        for (int i = 0; i <= 8'hff; i++) begin
            uart_seq_item item = uart_seq_item::type_id::create("item");
            start_item(item);
            item.tx_data = i;
            finish_item(item);
        end
    endtask
endclass

`endif

