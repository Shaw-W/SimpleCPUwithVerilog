`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:37:12 06/10/2020 
// Design Name: 
// Module Name:    RAM 
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
module RAM(
	clk,
	reset,
	addr,
	dout
);
 
input clk;       //时钟信号线
input reset;       //复位信号，高电平有效
input [3:0] addr;  //存储器地址

output reg [7:0] dout;  //数据线输出

 
reg [7:0] mem [0:31];  //内部的存储空间
 
always @(posedge clk or posedge reset) begin
	if (!reset) begin
	    mem [0] <= 'b00000001;      //LDA 01011
	    mem [1] <= 'b00000010;      //ADD 01100
	    mem [2] <= 'b00000011;      //STA 01101
	    mem [3] <= 'b00000100;      //LDA 01011
	    mem [4] <= 'b00000101;      //AND 01100
	    mem [5] <= 'b00000110;      //STA 01110
	    mem [6] <= 'b00000111;      //LDA 01011
	    mem [7] <= 'b00001000;      //SUB 01100
	    mem [8] <= 'b00001001;      //STA 01111
	    mem [9] <= 'b00001010;      //HLT
	    mem [10] <= 'b00001011;
	    mem [11] <= 'b00001100;
	    mem [12] <= 'b00001101;
	    mem [13] <= 'b00000000;
	    mem [14] <= 'b00000000;
	    mem [15] <= 'b00000000;

		
		
	end
	else 
		begin
				dout <= mem [addr];		
		end
end
endmodule
