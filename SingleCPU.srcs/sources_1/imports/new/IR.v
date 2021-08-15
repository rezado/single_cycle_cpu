//2021-5-25, ��ѱ�
//������CPU
//ָ��RAM
`timescale 1ns/10ps
module IR(
	input			           inst_ram_en, //Ƭѡ�źţ���Ϊ1
	input			           inst_ram_wen, //дʹ���źţ���Ϊ0
	input	     [31:0]	   IR_addr, //ָ���ַ
	output 	 [31:0]	   IR_out //IR���
	);
wire [31:0]Byte_addr; //ָ��RAM�а��ֽ�Ѱַ
reg [31:0]IR_array[31:0]; //IR���ݿ��32λ ��С64B

//�������ݵ��洢��������ʹ�þ���·��
initial begin
	$readmemb("D:/Codes/Verilog/Single_CPU/rtl/IR.txt", IR_array);
end

assign Byte_addr = IR_addr >> 2; //����ַת��Ϊ�ֽڵ�ַ
assign IR_out = inst_ram_en ? IR_array[Byte_addr] : 32'd0; //Ƭѡ�ź���Чʱ��ȡ����

endmodule