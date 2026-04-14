interface uart_if (
    input logic clk,
    input logic reset
);

    logic       tx_start;
    logic [7:0] tx_data;
    logic       tx_busy;
    logic       tx_done;
    logic       tx;
    logic       rx;
    logic [7:0] rx_data;
    logic       rx_done;

    // driver용 — DUT 입력만 output, DUT 출력은 input
    clocking drv_cb @(posedge clk);
        default input #1step output #1;
        output tx_start;
        output tx_data;
        input tx_busy;
        input tx_done;
    endclocking

    // monitor용 — 전부 input
    clocking mon_cb @(posedge clk);
        default input #1step;
        input tx_start;
        input tx_data;
        input tx_busy;
        input tx_done;
        input tx;
        input rx_data;  
        input rx_done;  
    endclocking

endinterface
