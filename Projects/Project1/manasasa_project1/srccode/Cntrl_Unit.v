
module cntrl_unit(
input [2:0]opcode,
output reg Jmp,MemRead,MemtoReg,MemWrite,ALUsrc,RegWrite,
output reg ALUop
);

 always@*
	begin
	case(opcode)
		3'b000 : begin		//I-type lw
				Jmp=0;
				MemRead=1;
				MemtoReg=1;
				MemWrite=0;
				ALUsrc=1;
				RegWrite=1;
				ALUop=1'b0;
			     end
		3'b001 : begin		//I-type sw
				Jmp=0;
				MemRead=0;
				MemtoReg=0;
				MemWrite=1;
				ALUsrc=1;
				RegWrite=0;
				ALUop=1'b0;
			     end
		3'b010 : begin		//J-type
				Jmp=1;
				MemRead=0;
				MemtoReg=0;
				MemWrite=0;
				ALUsrc=0;
				RegWrite=0;
				ALUop=1'b0;
			     end
		3'b011 : begin		//R-type add
				Jmp=0;
				MemRead=0;
				MemtoReg=0;
				MemWrite=0;
				ALUsrc=0;
				RegWrite=1;
				ALUop=1'b0;
			     end
		3'b100 : begin		//I-type addi
				Jmp=0;
				MemRead=0;
				MemtoReg=0;
				MemWrite=0;
				ALUsrc=1;
				RegWrite=1;
				ALUop=1'b0;
			     end
		3'b101 : begin		//R-type sub
				Jmp=0;
				MemRead=0;
				MemtoReg=0;
				MemWrite=0;
				ALUsrc=0;
				RegWrite=1;
				ALUop=1'b1;
			     end
		default: ALUop=1'b0;

	endcase
	end
endmodule