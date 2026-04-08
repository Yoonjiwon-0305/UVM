module counter (
    input  logic       clk,
    input  logic       reset_n,  // 실무에서는 negative reset
    input  logic       enable,
    output logic [3:0] count
);

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            count <= 0;
        end else begin
            if (enable) count <= count + 1;
        end
    end
endmodule
