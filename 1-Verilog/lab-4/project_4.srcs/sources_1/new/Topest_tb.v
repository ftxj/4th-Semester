`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/31 21:01:54
// Design Name: 
// Module Name: Topest_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Topest_tb();

reg clock, reset, start;
wire [6:0]part_of_sum_out;
wire done;

initial
	begin
		clock = 0;
		reset = 1;
		start = 0;
		#20 reset = 0;
		#20 start = 1;
		#500 start = 0;
	end

always #10 clock = ~clock;

Topest T1(.clock(clock), .start(start), .reset(reset), .part_of_sum_out(part_of_sum_out), .done(done));

endmodule