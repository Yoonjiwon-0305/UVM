module ram (
    input  logic        clk,
    input  logic        reset_n,
    input  logic        write,
    input  logic [ 7:0] addr,
    input  logic [15:0] wdata,
    output logic [15:0] rdata
);

    logic [15:0] ram[0:255];

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            rdata <= 0;
        end else begin
            if (write) begin
                ram[addr] <= wdata;
            end else begin
                rdata <= ram[addr];
            end
        end
    end
endmodule
