module reg_file(
input clk,en,
input write_read_reg1, read_reg2,
input [7:0]write_data,
output [7:0]read_data1,read_data2
);
reg [7:0]array[1:0];
integer a,i;
initial
begin
for(a=0; a<2; a=a+1)
	begin
	array[a]<=8'b0;
	end
end

always@(posedge clk)
begin
	if (en)
		array[write_read_reg1]<=write_data;
end
assign read_data1=array[write_read_reg1];
assign read_data2=array[read_reg2];

task print;
	for(i=0; i<2; i=i+1)
		$display("Register[%h] = %b", i, array[i]);
endtask

endmodule