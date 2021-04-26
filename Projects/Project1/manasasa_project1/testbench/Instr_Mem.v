module inst_mem(
input [7:0]Inst_Addr,
input reset,
output wire [7:0]Instruction
);

reg [7:0] ins_mem [255:0];
reg [7:0] Inst_reg;
wire [7:0] pc;


// initial begin
//   $readmemb("data.bin", ins_mem);
// end

initial begin
	ins_mem[0] = 8'b10010010;
//Test Program----------------
	ins_mem[1] = 8'b00101000;
	ins_mem[2] = 8'b00001000;
	ins_mem[3] = 8'b01100000;
	ins_mem[4] = 8'b10000010;
	ins_mem[5] = 8'b01000001;
	ins_mem[6] = 8'b00101000;
	ins_mem[7] = 8'b10111000;
//----------------------------	
	ins_mem[8] = 8'b01111000;
	ins_mem[9] = 8'b01111000;
	ins_mem[11] = 8'b01111000;
	ins_mem[12] = 8'b01111000;
	ins_mem[13] = 8'b01111000;
	ins_mem[14] = 8'b01111000;
	ins_mem[15] = 8'b01111000;
	ins_mem[16] = 8'b01111000;
	ins_mem[17] = 8'b01111000;
	ins_mem[18] = 8'b01111000;
	ins_mem[19] = 8'b01111000;
	ins_mem[20] = 8'b01111000;
	ins_mem[31] = 8'b01111000;
	ins_mem[32] = 8'b01111000;
	ins_mem[33] = 8'b01111000;
	ins_mem[34] = 8'b01111000;
	ins_mem[35] = 8'b01111000;
	ins_mem[36] = 8'b01111000;
	ins_mem[37] = 8'b01111000;
	ins_mem[38] = 8'b01111000;
	ins_mem[39] = 8'b01111000;
	ins_mem[40] = 8'b01111000;
	ins_mem[41] = 8'b01111000;
	ins_mem[42] = 8'b01111000;
	ins_mem[43] = 8'b01111000;
	ins_mem[44] = 8'b01111000;
	ins_mem[45] = 8'b01111000;
	ins_mem[46] = 8'b01111000;
	ins_mem[47] = 8'b01111000;
	ins_mem[48] = 8'b01111000;
	ins_mem[49] = 8'b01111000;
	ins_mem[50] = 8'b01111000;
	ins_mem[51] = 8'b01111000;
	ins_mem[52] = 8'b01111000;
	ins_mem[53] = 8'b01111000;
	ins_mem[54] = 8'b01111000;
	ins_mem[55] = 8'b01111000;
	ins_mem[56] = 8'b01111000;
	ins_mem[57] = 8'b01111000;
	ins_mem[58] = 8'b01111000;
	ins_mem[59] = 8'b01111000;
	ins_mem[60] = 8'b01111000;
	ins_mem[61] = 8'b01111000;
	ins_mem[62] = 8'b01111000;
	ins_mem[63] = 8'b01111000;
	ins_mem[64] = 8'b01111000;
	ins_mem[65] = 8'b01111000;
	ins_mem[66] = 8'b01111000;
	ins_mem[67] = 8'b01111000;
	ins_mem[68] = 8'b01111000;
	ins_mem[69] = 8'b01111000;
	ins_mem[70] = 8'b01111000;
end	

always@(Inst_Addr)
begin
	if(reset)
		Inst_reg <= 0;
	else
		Inst_reg <=  ins_mem[Inst_Addr];
end

assign Instruction = Inst_reg;

endmodule