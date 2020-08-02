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
input		[15:0] data_in;   //��4λ�������ַ����8λ��������ַ
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
	clk(clk),   //ʱ�Ӷ˿�
   reset(n_Rst),   //��λ�˿�
   code_in(data_in),  //ָ������˿�
   code_addr(cade),       //����������˿�
   data_addr(data),      //�洢����ַ����˿�
	);	
	
endmodule
