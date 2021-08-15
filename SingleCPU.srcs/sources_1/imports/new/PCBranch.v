//2021-7-12,��ѱ�
//PCBranch
`timescale 1ns/10ps
module PCBranch(
	input       [31:0]   pcadd, //PC+4
	input       [15:0]   offset, //BEQ BNE
	input                beq_bne_jump, //beq bne����ת�ź�
	input       [25:0]   instr_index, //JAL
	output      [31:0]   beqpc, //ִ��beq��ת��PC
	output      [31:0]   jalpc //ִ��jal��ת��PC
);
wire [31:0] signleft_offset; //offset������չ ������λ
assign signleft_offset = {{14{offset[15]}}, offset, 2'b00};
assign beqpc = beq_bne_jump ?  pcadd+signleft_offset : pcadd;
assign jalpc = {pcadd[31], pcadd[30], pcadd[29], pcadd[28], instr_index[23:0], 2'b00};

endmodule