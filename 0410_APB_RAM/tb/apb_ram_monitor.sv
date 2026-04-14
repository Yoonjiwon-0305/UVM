`ifndef MONITOR_SV
`define MONITOR_SV

`include "uvm_macros.svh"
import uvm_pkg::*;
`include "apb_ram_seq_item.sv"

class apb_monitor extends uvm_monitor;
    `uvm_component_utils(apb_monitor)

    uvm_analysis_port #(apb_seq_item) ap;
    virtual apb_if v_if;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        ap = new("ap", this);
        if (!uvm_config_db#(virtual apb_if)::get(this, "", "v_if", v_if)) begin
            `uvm_fatal(get_type_name(),
                       "monitor에서 uvm_config_db 에러 발생");
        end
    endfunction

    virtual task run_phase(uvm_phase phase);
        `uvm_info(get_type_name(), "APB 버스 모니터링 시작 ...",
                  UVM_MEDIUM)
        forever begin
            collect_transaction();
        end
    endtask

    task collect_transaction();
        apb_seq_item tx;
        @(v_if.mon_cb);

        if(v_if.mon_cb.p_sel && v_if.mon_cb.p_enable && v_if.mon_cb.p_ready)begin
            tx          = apb_seq_item::type_id::create("mon_tx");
            tx.p_addr   = v_if.mon_cb.p_addr;
            tx.p_write  = v_if.mon_cb.p_write;
            tx.p_wdata  = v_if.mon_cb.p_wdata;
            tx.p_rdata  = v_if.mon_cb.p_rdata;
            tx.p_ready  = v_if.mon_cb.p_ready;
            tx.p_enable = v_if.mon_cb.p_enable;
            tx.p_sel    = v_if.mon_cb.p_sel;
            `uvm_info(get_type_name(),
                      $sformatf("mon tx: %s", tx.convert2string()), UVM_MEDIUM)
            ap.write(tx);
        end
    endtask


endclass
`endif
