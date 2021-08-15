//2021-5-25, 吴佳宾
//单周期CPU
//指令RAM
`timescale 1ns/10ps
module IR(
	input			           inst_ram_en, //片选信号，恒为1
	input			           inst_ram_wen, //写使能信号，恒为0
	input	     [31:0]	   IR_addr, //指令地址
	output 	 [31:0]	   IR_out //IR输出
	);
wire [31:0]Byte_addr; //指令RAM中按字节寻址
reg [31:0]IR_array[31:0]; //IR数据宽度32位 大小64B

//加载数据到存储器，必须使用绝对路径
initial begin
	$readmemb("D:/Codes/Verilog/Single_CPU/rtl/IR.txt", IR_array);
end

assign Byte_addr = IR_addr >> 2; //将地址转换为字节地址
assign IR_out = inst_ram_en ? IR_array[Byte_addr] : 32'd0; //片选信号有效时读取数据

endmodule