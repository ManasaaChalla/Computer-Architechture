module TB_Top;
reg clk,reset;

Single_cycle_8bit_Processor dut(clk,reset);

initial begin
clk = 1'b0;
forever #50 clk = ~clk;
end

initial
begin
	reset = 1'b1;
	#100
	reset = 1'b0;

	#16000
	dut.print();
	$finish;

end

endmodule