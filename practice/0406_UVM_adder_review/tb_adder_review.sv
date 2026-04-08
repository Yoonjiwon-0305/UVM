`include "uvm_macros.svh"  // 매크로 사용 가능 
import uvm_pkg::*;  // UVM클래스 사용가능 

interface adder_if;
    logic [7:0] a;
    logic [7:0] b;
    logic [8:0] y;
endinterface  //adder_if

module tb_adder ();

    adder_if a_if ();

    adder dut (
        .a(a_if.a),
        .b(a_if.b),
        .y(a_if.y)
    );


endmodule
