
module sign_ext(
input [7:0]Instruction,
input wire [2:0]opcode,
output reg [7:0]imm_data
);


always@*
begin
	case(opcode)
		3'b000 : imm_data={{5{Instruction[2]}}, Instruction[2:0]};		// I-type lw
		3'b001 : imm_data={{5{Instruction[2]}}, Instruction[2:0]};		// I-type sw
		3'b010 : imm_data={{3{Instruction[4]}}, Instruction[4:0]};		// I-type jmp
		3'b100 : imm_data={{5{Instruction[2]}}, Instruction[2:0]};		// I-type addi
	default: imm_data={{5{Instruction[2]}}, Instruction[2:0]};
	endcase
end
endmodule