
module instr_fetch(
input clk,reset,
input wire Jmp,
input [7:0]imm_data,
output [7:0]Instruction 
);

reg [7:0]pc_out,Inst_Addr;
reg [7:0]pc_in;
wire [7:0]out,sum;

inst_mem z1(Inst_Addr,reset,Instruction);

always@(posedge clk, posedge reset)
begin
	if (reset)
		pc_out<=0;
	else
		pc_out<=pc_in;
end

assign out=pc_out+1;
assign sum=pc_out+imm_data;

always@*
	if(Jmp)
		pc_in=sum;
	else
		pc_in=out;
	
always@*
	Inst_Addr <= pc_out;
endmodule

