`timescale 1ns / 1ps
`include "uvm_macros.svh"
import uvm_pkg::*;

`include "ram_interface.sv"  // 1. interface (가장 먼저)
`include "ram_seq_item.sv"  // 2. seq_item
`include "ram_sequence.sv"  // 3. sequence (seq_item 필요)
`include "ram_driver.sv"  // 4. driver
`include "ram_monitor.sv"  // 5. monitor
`include "ram_scoreboard.sv"  // 6. scoreboard
`include "ram_coverage.sv"  // 7. coverage
`include "ram_agent.sv"  // 8. agent (driver,monitor 필요)
`include "ram_env.sv"  // 9. env (agent,scb,cov 필요)
`include "ram_test.sv"  // 10. test (env 필요)

module tb_ram ();
    logic clk;
    initial clk = 0;
    always #5 clk = ~clk;

    ram_if r_if (clk);


    ram dut (
        .clk  (clk),
        .wr   (r_if.wr),
        .addr (r_if.addr),
        .wdata(r_if.wdata),
        .rdata(r_if.rdata)
    );

    initial begin
        uvm_config_db#(virtual ram_if)::set(null, "*", "r_if", r_if);
        run_test();
    end

    initial begin
        $fsdbDumpfile("novas.fsdb");
        $fsdbDumpvars(0, tb_ram, "+all");
    end
endmodule
