module tb_adder();

	logic [7:0] a;
	logic [7:0] b;
	logic [8:0] y;

	adder dut(.*);

	initial begin
		$fsdbDumpfile("wave.fsdb");
		$fsdbDumpvars(0, tb_adder); // ✅ tb_adder부터 모든 하위 계층 덤프
	end

	initial begin
		a=0;
		b=0;
		$display("%0d + %0d = %0d",a,b,y);
		#10;

		a=1;
		b=2;
		$display("%0d + %0d = %0d",a,b,y);
		#10;

		a=20;
		b=30;
		$display("%0d + %0d = %0d",a,b,y);
		#10;

		a=25;
		b=36;
		$display("%0d + %0d = %0d",a,b,y);
		#10;

		a=1;
		b=50;
		$display("%0d + %0d = %0d",a,b,y);
		#10;

		a=22;
		b=22;
		$display("%0d + %0d = %0d",a,b,y);
		#10;
	end	
endmodule
