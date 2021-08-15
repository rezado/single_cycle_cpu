//2021-6-2,��ѱ�
//����RAM
`timescale 1ns/10ps
module DR(
	input         CLK, //ʱ��
	input         en, //Ƭѡ�ź�
	input         we, //дʹ��
	input  [ 4:0] addr, //����д��ַ
	input  [31:0] wdata, //д����
	output [31:0] rdata //������
);

reg [31:0] reg_array [31:0];
//�������ݵ��洢��������ʹ�þ���·��
initial begin
	$readmemh("D:/Codes/Verilog/Single_CPU/rtl/DR.txt", reg_array);
end
//Write
always@(negedge CLK) begin
	if(en && we) reg_array[addr] <= wdata;
end
//Read
assign rdata = en ? reg_array[addr] : 32'd0;

endmodule