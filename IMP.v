`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Compaccny: 
// Engineer: 
// 
// Creaccte Daccte:    20:01:08 06/11/2020 
// Design Naccme: 
// Module Naccme:    IMP 
// Project Naccme: 
// Taccrget Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Creaccted
// accdditionaccl Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module IMP(
	clk,
	reset,
	in_data,
	code,
	acc,
	dout,
	wr,
	rd
    );
input clk,reset,wr,rd;
input	[7:0] in_data;
input	[7:0] code;
input [7:0] acc;

output	[7:0] dout;

parameter load_rom = 8'b00000001,
			 load_num = 8'b00000010,
			 out_rom  = 8'b00000011,
			 clr      = 8'b00000100,
			 inc		 = 8'b00000101,
			 sleep    = 8'b00001010,
			 dec      = 8'b00001100,
			 out      = 8'b00001101;
 
reg		[24:0] timer;
reg		[7:0] dout;
reg		[7:0] addr_ROM;
reg		[7:0] out_ROM;

ROM rom(
	clk(clk),
	reset(reset),
	addr(addr_ROM),
	din(acc),
	dout(out_ROM),
	wr,
	rd
);

always@(posedge clk or negedge reset)
	begin
		case(code)
			 clr:			acc <= 0;
			 inc:			acc <= acc+1;
			 load_num:	acc <= in_data;
			 out:			dout<= acc;
			 sleep:
					begin
							if(timer < 10000)
								timer <= timer+1;
							else
								timer <= 0;
					end
			 load_rom:
					begin
							rd<=2'b1;
							wr<=2'b0;
							addr_ROM<=in_data;
							acc <= out_ROM;
					end
			 out_rom:
					begin
							rd<=2'b0;
							wr<=2'b1;
							addr_ROM<=in_data;
					end
			default:	;
		endcase
	end
endmodule
