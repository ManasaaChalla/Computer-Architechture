module Single_cycle_8bit_Processor(
input clk,reset	
);

wire [7:0]a,b;
wire [7:0]result;
wire c_out;
wire [7:0]Instruction;
wire Jmp,MemRead,MemtoReg,MemWrite,ALUsrc,RegWrite;
wire ALUop;
wire [2:0]opcode;
wire rd_rs1,rs2;
wire write_read_reg1, read_reg2;
wire en,write_en,read_en;
wire [7:0]write_data,write_data_M;
wire [7:0]read_data;
wire [7:0]mem_addr;
wire [7:0]read_data1,read_data2;
wire [7:0]imm_data;

instr_fetch Instruction_fetch(clk,reset,Jmp,imm_data,Instruction);

instr_dec Instr_Dec(Instruction,opcode,rd_rs1,rs2);

cntrl_unit control_unit(opcode,Jmp,MemRead,MemtoReg,MemWrite,ALUsrc,RegWrite,ALUop);

	assign en=RegWrite;
	assign write_read_reg1=rd_rs1;
	assign read_reg2=rs2;

reg_file Reg_file(clk,en,write_read_reg1,read_reg2,write_data,read_data1,read_data2);

task print;
Reg_file.print();
endtask

sign_ext Sign_Extend(Instruction,opcode,imm_data);

	// assign a=read_data1;
	// assign b=read_data2;

	assign a=(ALUsrc)?imm_data:read_data1;
	assign b=read_data2;

Alu ALU(a,b,ALUop,result,c_out);

	assign read_en=MemRead;
	assign write_en=MemWrite;
	assign mem_addr=result;
	assign write_data_M=write_read_reg1;

data_mem Data_memory(mem_addr,write_data_M,clk,reset,write_en,read_en,opcode,read_data);

assign write_data=(MemtoReg)?read_data:result;

endmodule