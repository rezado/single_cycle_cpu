//2021-6-1����ѱ�
//ͨ�üĴ�����д���������߼�
`timescale 1ns/10ps
module GenRFRes(
	input [31:0] in0, //in0��ӦALU������alu_res
	input [31:0] in1, //in1��Ӧ��RAM������load��������ֵld_res
	input sel_rf_res,  //ѡ���ź� 1ѡ��DRAM��� 0��ӦALU���
	output [31:0] rf_res //�������
	);

assign rf_res = sel_rf_res ? in1 : in0;

endmodule