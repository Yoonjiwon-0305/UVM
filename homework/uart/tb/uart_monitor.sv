`ifndef UART_MONITOR_SV
`define UART_MONITOR_SV

`timescale 1ns / 1ps
`include "uvm_macros.svh"
import uvm_pkg::*;
`include "uart_seq_item.sv"

class uart_monitor extends uvm_monitor;
    `uvm_component_utils(uart_monitor)

    virtual uart_if u_if;

    uvm_analysis_port #(uart_seq_item) ap;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        ap = new("ap", this);
        if (!uvm_config_db#(virtual uart_if)::get(this, "", "u_if", u_if)) begin
            `uvm_fatal(get_type_name(),
                       "ram interface를 config_db에서 가져올 수 없음")
        end
    endfunction

    virtual task run_phase(uvm_phase phase);
        uart_seq_item item;  // ← forever 밖으로
        forever begin
            @(u_if.mon_cb);
            if (u_if.mon_cb.rx_done) begin
                item = uart_seq_item::type_id::create("item");
                item.tx_data = u_if.mon_cb.tx_data;
                item.rx_data = u_if.mon_cb.rx_data;
                ap.write(item);
                `uvm_info(get_type_name(), item.convert2string(), UVM_MEDIUM)
            end
        end
    endtask


endclass



`endif
