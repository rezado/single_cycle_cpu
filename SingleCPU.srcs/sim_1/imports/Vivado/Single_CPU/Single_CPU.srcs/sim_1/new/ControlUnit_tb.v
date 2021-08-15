`timescale 1ns/10ps
//2021-7-12,吴佳宾
//------testbench of ControlUnit-----
module ControlUnit_tb();
reg   [31:0] instruct;
wire  [ 5:0] op;
wire  [ 4:0] rs;
wire  [ 4:0] rt;
wire  [ 4:0] rd;
wire  [ 4:0] sa;
wire  [15:0] imm;
wire  [25:0] instr_index;
wire  [ 5:0] func;
wire         inst_ram_en; //指令RAM片选
wire         inst_ram_wen; //指令RAM读使能
wire  [ 2:0] sel_alu_src2; //ALU源操作数2
wire  [11:0] alu_op; //ALU操作码
wire         data_ram_en; //DataRam片选
wire         data_ram_wen; //DataRam读使能
wire         rf_we; //寄存器堆写使能
wire  [ 2:0] sel_rf_dst; //寄存器堆写地址生成逻辑
wire         sel_rf_res; //寄存器堆读地址生成逻辑
wire  [ 3:0] sel_nextpc;
wire  [ 1:0] sel_beqbne;
Instruct_Split Instruct_Split(
	.instruct(instruct),
	.op(op),
	.rs(rs),
	.rt(rt),
	.rd(rd),
	.sa(sa),
	.imm(imm),
	.func(func),
	.instr_index(instr_index)
);
ControlUnit ControlUnit(
	.op(op),
	.sa(sa),
	.func(func),
	.inst_ram_en(inst_ram_en),
	.inst_ram_wen(inst_ram_wen),
	.sel_alu_src2(sel_alu_src2),
	.alu_op(alu_op),
	.data_ram_en(data_ram_en),
	.data_ram_wen(data_ram_wen),
	.rf_we(rf_we),
	.sel_rf_dst(sel_rf_dst),
	.sel_rf_res(sel_rf_res),
	.sel_beqbne(sel_beqbne),
	.sel_nextpc(sel_nextpc)
);
reg [31:0] IR_array[31:0];
integer i = 0;
initial begin
	$readmemb("D:/Codes/Vivado/SingleCPU/SingleCPU.srcs/sources_1/new/IR.txt", IR_array);
end

initial begin
	#300 $stop;
end
always #10 begin
	instruct <= IR_array[i];
	i = i + 1;
end

endmodule