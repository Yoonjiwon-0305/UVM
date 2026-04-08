module counter (
    input  logic       clk,
    input  logic       reset_n,
    input  logic       enable,
    output logic [3:0] count
);

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin  // reset_n =0 일때
            count <= 0;
        end else begin  // reset_n =1 일때 
            if (enable) begin
                count <= count + 1;
            end
        end
    end

endmodule

// 원래는 if(reset) begin 
//         count<=0;
// 이렇게 하면 reset=1일 때 reset이 된다 ]
// but 실무에서는 reset이 0일때 reset이 되는 경우가 많기 때문에 위와 같이 한다