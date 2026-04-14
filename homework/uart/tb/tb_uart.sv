`timescale 1ns / 1ps
`include "uvm_macros.svh"
import uvm_pkg::*;

`include "uart_interface.sv"  // 1. interface (가장 먼저)
`include "uart_seq_item.sv"  // 2. seq_item
`include "uart_sequence.sv"  // 3. sequence (seq_item 필요)
`include "uart_driver.sv"  // 4. driver
`include "uart_monitor.sv"  // 5. monitor
`include "uart_scoreboard.sv"  // 6. scoreboard
`include "uart_coverage.sv"  // 7. coverage
`include "uart_agent.sv"  // 8. agent (driver,monitor 필요)
`include "uart_env.sv"  // 9. env (agent,scb,cov 필요)
`include "uart_test.sv"  // 10. test (env 필요)

module tb_uart ();

    logic clk;
    logic reset;

    always #5 clk = ~clk;

    initial begin
        clk   = 0;
        reset = 1;
        repeat (3) @(posedge clk);
        reset = 0;
        @(posedge clk);
    end

    uart_if u_if (
        clk,
        reset
    );

    uart_top dut (
        .clk     (clk),
        .reset   (reset),
        .tx_start(u_if.tx_start),
        .tx_data (u_if.tx_data),
        .tx_busy (u_if.tx_busy),
        .tx_done (u_if.tx_done),
        .tx      (u_if.tx),
        .rx      (u_if.rx),
        .rx_data (u_if.rx_data),
        .rx_done (u_if.rx_done)
    );

    initial begin
        uvm_config_db#(virtual uart_if)::set(null, "", "u_if", u_if);
        run_test();
    end
    initial begin
        $fsdbDumpfile("novas.fsdb");
        $fsdbDumpvars(0, tb_uart, "+all");
    end

endmodule
