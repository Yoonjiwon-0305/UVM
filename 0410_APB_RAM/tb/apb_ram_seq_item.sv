`ifndef SEQ_ITEM_SV
`define SEQ_ITEM_SV

`include "uvm_macros.svh"
import uvm_pkg::*;

class apb_seq_item extends uvm_sequence_item;
    rand logic [ 7:0] p_addr;
    rand logic        p_write;
    rand logic        p_enable;
    rand logic [31:0] p_wdata;
    rand logic        p_sel;
    logic      [31:0] p_rdata;
    logic             p_ready;

    constraint c_addr {p_addr % 4 == 0;}

    `uvm_object_utils_begin(apb_seq_item)
        `uvm_field_int(p_addr, UVM_ALL_ON)
        `uvm_field_int(p_write, UVM_ALL_ON)
        `uvm_field_int(p_enable, UVM_ALL_ON)
        `uvm_field_int(p_wdata, UVM_ALL_ON)
        `uvm_field_int(p_sel, UVM_ALL_ON)
        `uvm_field_int(p_rdata, UVM_ALL_ON)
        `uvm_field_int(p_ready, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "apb_seq_item");
        super.new(name);
    endfunction

    function string convert2string();
        string op = p_write ? "WRITE" : "READ";
        return $sformatf(
            "%s p_addr=0x%02h p_wdata=0x%08h, prdata=0x%08h",
            op,
            p_addr,
            p_wdata,
            p_rdata
        );
    endfunction

endclass
`endif
