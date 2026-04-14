module uart #(
    parameter int BAUD_RATE = 9_600
) (
    input  logic       clk,
    input  logic       reset,
    //tx port
    input  logic [7:0] tx_data,
    input  logic       tx_start,
    output logic       tx,
    output logic       tx_busy,
    //rx_port
    input  logic       rx,
    output logic [7:0] rx_data,
    output logic       rx_done
);

    logic b_tick;
    logic rx_sync;

    baud_rate_gen #(
        .BAUD_RATE(BAUD_RATE)
    ) U_BAUD_RATE_GEN (
        .clk   (clk),
        .reset (reset),
        .b_tick(b_tick)
    );

    uart_tx U_UART_TX (
        .clk     (clk),
        .reset   (reset),
        .b_tick  (b_tick),
        .tx_data (tx_data),
        .tx_start(tx_start),
        .tx      (tx),
        .tx_busy (tx_busy)
    );

    sync_2ff U_SYNC_RX (
        .clk     (clk),
        .reset   (reset),
        .async_in(rx),
        .sync_out(rx_sync)

    );

    uart_rx U_UART_RX (
        .clk    (clk),
        .reset  (reset),
        .b_tick (b_tick),
        .rx     (rx_sync),
        .rx_data(rx_data),
        .rx_done(rx_done)
    );

endmodule
