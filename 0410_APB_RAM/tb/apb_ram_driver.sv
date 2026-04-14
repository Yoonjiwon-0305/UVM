`ifndef DRIVER_SV
`define DRIVER_SV

`include "uvm_macros.svh"
import uvm_pkg::*;
`include "apb_ram_seq_item.sv"

class apb_driver extends uvm_driver #(apb_seq_item);
    `uvm_component_utils(apb_driver)

    virtual apb_if v_if;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual apb_if)::get(this, "", "v_if", v_if)) begin
            `uvm_fatal(get_type_name(),
                       "driver에서 uvm_config_db 에러 발생");
        end
    endfunction

    virtual task run_phase(uvm_phase phase);
        apb_bus_init();
        wait (v_if.p_reset == 1);
        `uvm_info(
            get_type_name(), "리셋 해제 확인. 트랜젝션 대기 중...",
            UVM_MEDIUM)
        forever begin
            apb_seq_item tx;
            seq_item_port.get_next_item(tx);
            driver_apb(tx);
            seq_item_port.item_done();

        end
    endtask

    task apb_bus_init();
        v_if.drv_cb.p_sel    <= 0;
        v_if.drv_cb.p_enable <= 0;
        v_if.drv_cb.p_write  <= 0;
        v_if.drv_cb.p_addr   <= 0;
        v_if.drv_cb.p_wdata  <= 0;
    endtask

    task driver_apb(apb_seq_item tx);
        //SET UP PHASE
        @(v_if.drv_cb);
        v_if.drv_cb.p_sel    <= 1;
        v_if.drv_cb.p_enable <= 0;
        v_if.drv_cb.p_write  <= tx.p_write;
        v_if.drv_cb.p_addr   <= tx.p_addr;
        v_if.drv_cb.p_wdata  <= tx.p_write ? tx.p_wdata : 0;

        //ACCESS phase
        @(v_if.drv_cb);
        v_if.drv_cb.p_enable <= 1;
        //wait (v_if.drv_cb.p_ready == 1);
        while (!v_if.drv_cb.p_ready) begin
            @(v_if.drv_cb);
        end
        if (!tx.p_write) begin
            tx.p_rdata = v_if.drv_cb.p_rdata;
            tx.p_ready = v_if.drv_cb.p_ready;
        end

        //IDLE phase
        @(v_if.drv_cb);
        v_if.drv_cb.p_sel    <= 0;
        v_if.drv_cb.p_enable <= 0;

        `uvm_info(get_type_name(), $sformatf("drv apb 구동 완료: %s",
                  tx.convert2string()), UVM_MEDIUM)

    endtask
endclass
`endif
