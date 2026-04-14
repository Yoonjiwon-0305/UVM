module tb_uart ();

    logic       clk;
    logic       reset;
    logic [7:0] tx_data;
    logic       tx_start;
    logic       tx;
    logic       tx_busy;
    logic       rx;
    logic [7:0] rx_data;
    logic [7:0] rx_data_temp;
    logic       rx_done;

    logic [7:0] uart_que[$];

    assign rx = tx;

    uart #(
        .BAUD_RATE(9600)
    ) dut (
        .clk     (clk),
        .reset   (reset),
        .tx_data (tx_data),
        .tx_start(tx_start),
        .tx      (tx),
        .tx_busy (tx_busy),
        .rx      (rx),
        .rx_data (rx_data),
        .rx_done (rx_done)
    );

    always #5 clk = ~clk;

    task send_data(int loop);
        repeat (loop) begin
            tx_data = $urandom();
            uart_que.push_back(tx_data);
            tx_start = 1'b1;
            @(posedge clk);
            tx_start = 1'b0;
            @(posedge clk);
            wait (tx_busy == 1'b0);
            @(posedge clk);
        end
    endtask

    task receive_data();
        forever begin
            wait (rx_done == 1'b1);
            rx_data_temp = rx_data;
            @(posedge clk);
            if (rx_data_temp == uart_que.pop_front()) begin
                $display("PASS! rx_data and tx_data is same.");
            end else begin
                $display("FAIL! rx_data and tx_data is different.");
            end
        end
    endtask

    initial begin
        clk      = 0;
        reset    = 1;
        tx_start = 0;
        tx_data  = 0;
        repeat (3) @(posedge clk);
        reset = 0;
        repeat (3) @(posedge clk);

        fork
            send_data(5);
            receive_data();
        join_any

        #30;
        $finish;
    end

    initial begin
        $fsdbDumpfile("novas.fsdb");
        $fsdbDumpvars(0, tb_uart, "+all");
    end

endmodule