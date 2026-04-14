`timescale 1ns / 1ps
`include "uvm_macros.svh"
import uvm_pkg::*;

`include "apb_ram_interface.sv"  // 1. interface (가장 먼저)
`include "apb_ram_seq_item.sv"  // 2. seq_item
`include "apb_ram_sequence.sv"  // 3. sequence (seq_item 필요)
`include "apb_ram_driver.sv"  // 4. driver
`include "apb_ram_monitor.sv"  // 5. monitor
`include "apb_ram_scoreboard.sv"  // 6. scoreboard
`include "apb_ram_coverage.sv"  // 7. coverage
`include "apb_ram_agent.sv"  // 8. agent (driver,monitor 필요)
`include "apb_ram_env.sv"  // 9. env (agent,scb,cov 필요)
`include "apb_ram_test.sv"  // 10. test (env 필요)

module tb_apb ();
    logic p_clk;
    logic p_reset;

    initial p_clk = 0;
    always #5 p_clk = ~p_clk;

    apb_if v_if (
        p_clk,
        p_reset
    );

    apb_ram dut (
        .p_clk   (p_clk),
        .p_reset (p_reset),
        .p_addr  (v_if.p_addr),
        .p_write (v_if.p_write),
        .p_enable(v_if.p_enable),
        .p_wdata (v_if.p_wdata),
        .p_sel   (v_if.p_sel),
        .p_rdata (v_if.p_rdata),
        .p_ready (v_if.p_ready)
    );

    initial begin
        p_clk   = 0;
        p_reset = 0;
        repeat (5) @(posedge p_clk);
        p_reset = 1;
    end
    initial begin
        uvm_config_db#(virtual apb_if)::set(null, "*", "v_if", v_if);
        run_test();
    end

    initial begin
        $fsdbDumpfile("novas.fsdb");
        $fsdbDumpvars(0, tb_apb, "+all");
    end
endmodule
