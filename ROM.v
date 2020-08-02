`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:45:20 06/10/2020 
// Design Name: 
// Module Name:    ROM 
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
module ROM(
	clk,
	reset,
	addr,
	din,
	dout,
	wr,
	rd
);
 
input clk;       //时钟信号线
input reset;       //复位信号，高电平有效
input [3:0] addr;  //存储器地址
input wr;          //写使能端，高电平有效
input rd;
input [7:0] din;   //数据线输入
output reg [7:0] dout;  //数据线输出

 
reg [7:0] mem [0:15];  //内部的存储空间
 
always @(posedge clk or negedge reset) begin
	if (!reset) begin
	    mem [0] <= 'b00000000;      
	    mem [1] <= 'b00000000;      
	    mem [2] <= 'b00000000;      
	    mem [3] <= 'b00000000;      
	    mem [4] <= 'b00000000;      
	    mem [5] <= 'b00000000;      
	    mem [6] <= 'b00000000;      
	    mem [7] <= 'b00000000;      
	    mem [8] <= 'b00000000;      
	    mem [9] <= 'b00000000;      
	    mem [10] <= 'b00000000;
	    mem [11] <= 'b00000000;
	    mem [12] <= 'b00000000;
	    mem [13] <= 'b00000000;
	    mem [14] <= 'b00000000;
	    mem [15] <= 'b00000000;

		
		
	end
	else begin
	   if (wr)
	      mem [addr] <= din;
	   if (rd)
	      dout <= mem [addr];		
	end
end


endmodule
