`ifndef UART_SCOREBOARD_SV
`define UART_SCOREBOARD_SV

`timescale 1ns / 1ps
`include "uvm_macros.svh"
import uvm_pkg::*;
`include "uart_seq_item.sv"

class uart_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(uart_scoreboard)

    uvm_analysis_imp #(uart_seq_item, uart_scoreboard) ap_imp;

    int pass_cnt = 0;
    int fail_cnt = 0;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        ap_imp = new("ap_imp", this);
    endfunction

    function void write(uart_seq_item item);
        if (item.tx_data === item.rx_data) begin
            pass_cnt++;
            `uvm_info(get_type_name(),
                      $sformatf("PASS: %s", item.convert2string()), UVM_MEDIUM)
        end else begin
            fail_cnt++;
            `uvm_error(get_type_name(), $sformatf(
                       "FAIL: %s", item.convert2string()))
        end
    endfunction


    virtual function void report_phase(uvm_phase phase);
        `uvm_info(get_type_name(), " ===== Scoreboard Summary =====", UVM_LOW)
        `uvm_info(get_type_name(), $sformatf(
                  " Total transaction: %0d", pass_cnt + fail_cnt), UVM_LOW)
        `uvm_info(get_type_name(), $sformatf(" Pass: %0d", pass_cnt), UVM_LOW)
        `uvm_info(get_type_name(), $sformatf(" Fail: %0d", fail_cnt), UVM_LOW)

        if (fail_cnt > 0) begin
            `uvm_error(get_type_name(),
                       $sformatf("TEST FAILED: %0d mismatches detected",
                                 fail_cnt))
        end else begin
            `uvm_info(get_type_name(), $sformatf(
                      "TEST PASSED: %0d all matches detected", pass_cnt),
                      UVM_LOW)

        end
    endfunction

endclass



`endif
