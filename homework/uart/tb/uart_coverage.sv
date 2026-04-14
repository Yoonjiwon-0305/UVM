`ifndef UART_COVERAGE_SV
`define UART_COVERAGE_SV

`timescale 1ns / 1ps
`include "uvm_macros.svh"
import uvm_pkg::*;

class uart_coverage extends uvm_subscriber #(uart_seq_item);
    `uvm_component_utils(uart_coverage)

    uart_seq_item item;

    covergroup uart_cg;
        cp_tx_data: coverpoint item.tx_data {
            bins low = {[8'h00 : 8'h03]};
            bins mid_low = {[8'h04 : 8'h07]};
            bins mid_high = {[8'h08 : 8'h0b]};
            bins high = {[8'h0c : 8'h0f]};
        }
    endgroup

    function new(string name, uvm_component parent);
        super.new(name, parent);
        uart_cg = new();
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    virtual function void write(uart_seq_item t);
        item = t;
        uart_cg.sample();
        `uvm_info(get_type_name(), $sformatf(
                  "sampled: %s", item.convert2string()), UVM_MEDIUM)
    endfunction

    virtual function void report_phase(uvm_phase phase);
        `uvm_info(get_type_name(), "\n\n===== Coverage Summary =====", UVM_LOW)
        `uvm_info(get_type_name(), $sformatf(
                  "     Overall: %.1f%%", uart_cg.get_coverage()), UVM_LOW)
        `uvm_info(get_type_name(), $sformatf(
                  "     tx_data:   %.1f%%", uart_cg.cp_tx_data.get_coverage()),
                  UVM_LOW);
        `uvm_info(get_type_name(), "\n\n===== Coverage Summary =====\n\n",
                  UVM_LOW)
    endfunction

endclass



`endif
