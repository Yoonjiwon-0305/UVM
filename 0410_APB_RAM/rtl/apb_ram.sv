module apb_ram (
    input  logic        p_clk,
    input  logic        p_reset,
    //APB interface signals
    input  logic [ 7:0] p_addr,
    input  logic        p_write,
    input  logic        p_enable,
    input  logic [31:0] p_wdata,
    input  logic        p_sel,
    output logic [31:0] p_rdata,
    output logic        p_ready
);

    logic [31:0] mem[0:2**6-1];

    assign p_ready = 1;

    always_ff @(posedge p_clk) begin
        if (p_sel & p_enable & p_write) begin
            mem[p_addr[7:2]] <= p_wdata;
        end
    end

    assign p_rdata = mem[p_addr[7:2]];

endmodule
