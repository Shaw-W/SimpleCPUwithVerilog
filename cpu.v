`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:31:47 06/10/2020 
// Design Name: 
// Module Name:    cpu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module cpu(
	clk,
	n_Rst,
	data_in,
	data_out);
	
input				 clk;
input				 n_Rst;
input		[15:0] data_in;   //低4位操作码地址，高8位操作数地址
output	[7:0]  data_out;

reg 		[7:0]  data_out;
wire				 w;
wire				 r;
reg		[7:0]  A;
reg		[7:0]  cade;
reg		[7:0]  data;

			 
IMP imp(
	clk(clk),
	reset(n_Rst),
	in_data(data),
	code(cade),
	acc(A),
	dout(data_out),
	wr(w),
	rd(r)
    ); 
IDEC idec(
	clk(clk),   //时钟端口
   reset(n_Rst),   //复位端口
   code_in(data_in),  //指令输入端口
   code_addr(cade),       //操作吗输出端口
   data_addr(data),      //存储器地址输出端口
	);	
	
endmodule
