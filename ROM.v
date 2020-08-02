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
 
input clk;       //ʱ���ź���
input reset;       //��λ�źţ��ߵ�ƽ��Ч
input [3:0] addr;  //�洢����ַ
input wr;          //дʹ�ܶˣ��ߵ�ƽ��Ч
input rd;
input [7:0] din;   //����������
output reg [7:0] dout;  //���������

 
reg [7:0] mem [0:15];  //�ڲ��Ĵ洢�ռ�
 
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
