`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/31 18:42:32
// Design Name: 
// Module Name: Latch
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


module Latch(
	input  wire clock,reset,load,
    input  wire [WIDTH-1:0]data,
    output reg  [WIDTH-1:0]result
);

parameter  WIDTH = 8;

always @(posedge clock)
	begin
		if(reset)     result <= 0;
		else if(load) result <= data;
	end

endmodule
