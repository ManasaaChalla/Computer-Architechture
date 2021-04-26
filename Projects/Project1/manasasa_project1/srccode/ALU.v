
module Alu(
input [7:0]a,b,
input wire ALUop,
output reg [7:0]result,
output reg c_out
);

always@*
begin
	case(ALUop)
		1'b0 : {c_out,result} <= a + b;			   //add
		1'b1 : result <= $signed(a) - $signed(b);  //sub
	endcase
end
endmodule