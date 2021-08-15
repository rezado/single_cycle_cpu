//2021-6-1,吴佳宾
//通用寄存器堆写地址生成逻辑
`timescale 1ns/10ps
module GenRFDst(
	input [4:0] in0, //对应指令的rd域
	input [4:0] in1, //对应指令的rt域
	input [2:0] sel_rf_dst, //选择信号
	output [4:0] rf_dst //寄存器堆写地址
	);

assign rf_dst = sel_rf_dst[0] ? in0 :
                sel_rf_dst[1] ? in1 :
                sel_rf_dst[2] ? 5'd31 : 5'd0;

endmodule