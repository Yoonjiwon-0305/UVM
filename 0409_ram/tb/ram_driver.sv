`ifndef RAM_DRIVER_SV
`define RAM_DRIVER_SV

`timescale 1ns / 1ps
`include "uvm_macros.svh"
import uvm_pkg::*;
`include "ram_seq_item.sv"


class ram_driver extends uvm_driver #(ram_seq_item);
    `uvm_component_utils(ram_driver)

    virtual ram_if r_if;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual ram_if)::get(this, "", "r_if", r_if)) begin
            `uvm_fatal(get_type_name(),
                       "ram interface를 config_db 에서 가져올 수 없음")
        end
    endfunction

    virtual task run_phase(uvm_phase phase);
        ram_seq_item item;
        forever begin
            seq_item_port.get_next_item(item);
            r_if.drv_cb.wr    <= item.wr;
            r_if.drv_cb.addr  <= item.addr;
            r_if.drv_cb.wdata <= item.wdata;
            @(r_if.drv_cb);

            if (!item.wr) begin
                @(r_if.drv_cb);  // ← read일 때만 추가 1클럭 대기
            end  //   rdata가 1클럭 후에 나오기 때문!

            `uvm_info(get_type_name(), item.convert2string(), UVM_MEDIUM)
            seq_item_port.item_done();
        end
    endtask

endclass



`endif
