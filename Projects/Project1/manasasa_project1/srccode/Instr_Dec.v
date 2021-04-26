
module instr_dec(
input wire [7:0]Instruction,
output [2:0]opcode,
output rd_rs1,rs2
);

assign opcode=Instruction[7:5];
assign rd_rs1=Instruction[4];
assign rs2=Instruction[3];
endmodule