`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:24:31 06/11/2020
// Design Name:   cpu
// Module Name:   D:/ISE_pRO/CPU/TEXT.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TEXT;

	// Inputs
	reg clk;
	reg n_Rst;
	reg [11:0] data_in;

	// Outputs
	wire [7:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	cpu uut (
		.clk(clk), 
		.n_Rst(n_Rst), 
		.data_in(data_in), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		n_Rst = 0;
		data_in = 0;

		// Wait 100 ns for global reset to finish
		#100;    
		#100 n_Rst=1;
  
		// Add stimulus here
		#100 data_in = 12'b001011111110;
		#100 data_in = 12'b110111111110;
	end
	
	always #5 clk = ~clk;
      
endmodule

