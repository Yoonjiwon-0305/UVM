`ifndef RAM_COVERAGE_SV
`define RAM_COVERAGE_SV

`timescale 1ns / 1ps
`include "uvm_macros.svh"
import uvm_pkg::*;

class ram_coverage extends uvm_subscriber #(ram_seq_item);
    `uvm_component_utils(ram_coverage)

    ram_seq_item item;

    covergroup ram_cg;
        cp_write: coverpoint item.wr {bins write_op = {1}; bins read_op = {0};}
        cp_addr: coverpoint item.addr {
            bins low = {[8'h00 : 8'h07]}; bins high = {[8'h08 : 8'h0F]};
        }
        cp_wdata: coverpoint item.wdata {
            bins zero = {16'h0000};  // 0x0000 단독
            bins range1 = {[16'h0001 : 16'h3FFF]};  // 0x0001 ~ 0x3FFF
            bins range2 = {[16'h4000 : 16'h7FFF]};  // 0x4000 ~ 0x7FFF
            bins range3 = {[16'h8000 : 16'hBFFF]};  // 0x8000 ~ 0xBFFF
            bins high     = {[16'hC000 : 16'hFFFF]};  // 0xC000 ~ 0xFFFF 
        }
        cx_write_addr: cross cp_write, cp_addr;
    endgroup



    function new(string name, uvm_component parent);
        super.new(name, parent);
        ram_cg = new();
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    virtual function void write(ram_seq_item t);
        item = t;
        ram_cg.sample();
        `uvm_info(get_type_name(), $sformatf(
                  "sampled: %s", item.convert2string()), UVM_MEDIUM)
    endfunction

    virtual function void report_phase(uvm_phase phase);
        `uvm_info(get_type_name(), "\n\n===== Coverage Summary =====", UVM_LOW)
        `uvm_info(get_type_name(), $sformatf(
                  "     Overall: %.1f%%", ram_cg.get_coverage()), UVM_LOW)
        `uvm_info(get_type_name(), $sformatf(
                  "     write:   %.1f%%", ram_cg.cp_write.get_coverage()),
                  UVM_LOW)
        `uvm_info(get_type_name(), $sformatf(
                  "     addr:    %.1f%%", ram_cg.cp_addr.get_coverage()),
                  UVM_LOW)
        `uvm_info(get_type_name(), $sformatf(
                  "     wdata:   %.1f%%", ram_cg.cp_wdata.get_coverage()),
                  UVM_LOW)
        `uvm_info(get_type_name(), $sformatf(
                  "     cross(write,addr): %.1f%%",
                  ram_cg.cx_write_addr.get_coverage()
                  ), UVM_LOW)
        `uvm_info(get_type_name(), "\n\n===== Coverage Summary =====\n\n",
                  UVM_LOW)
    endfunction

endclass



`endif
