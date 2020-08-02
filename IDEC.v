`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:05:03 06/11/2020 
// Design Name: 
// Module Name:    IDEC 
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
module IDEC(
		 clk,   //ʱ�Ӷ˿�
       reset,   //��λ�˿�
       code_in,  //ָ������˿�
       code_addr,       //����������˿�
       data_addr,         //�洢����ַ����˿�
	);
 
input clk,reset;
input [15:0] code_in;
output reg [7:0] code_addr;
output reg [7:0] data_addr;
 
always @(posedge clk or posedge reset) begin
	if (reset) begin
	    code_addr <= 0;
	    data_addr <= 0;
		// reset		
	end
	else
		begin
	    code_addr <= code_in [15:8];
	    data_addr <= code_in [7:0];
		end
end
endmodule