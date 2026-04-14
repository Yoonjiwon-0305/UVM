interface apb_if (
    input logic p_clk,
    input logic p_reset
);
    logic [ 7:0] p_addr;
    logic        p_write;
    logic        p_enable;
    logic [31:0] p_wdata;
    logic        p_sel;
    logic [31:0] p_rdata;
    logic        p_ready;

    clocking drv_cb @(posedge p_clk);
        default input #1step output #0;
        output p_addr;
        output p_write;
        output p_enable;
        output p_wdata;
        output p_sel;
        input p_rdata;
        input p_ready;
    endclocking

    clocking mon_cb @(posedge p_clk);
        default input #1step;
        input p_addr;
        input p_write;
        input p_enable;
        input p_wdata;
        input p_sel;
        input p_rdata;
        input p_ready;
    endclocking

    modport mod_drv(clocking drv_cb, input p_clk, input p_reset);
    modport mod_mon(clocking mon_cb, input p_clk, input p_reset);
endinterface
