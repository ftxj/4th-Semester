`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/31 18:07:25
// Design Name: 
// Module Name: Adder
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


module Adder(
    input  wire [WIDTH-1:0]data_A,
	input  wire [WIDTH-1:0]data_B,
	output wire [WIDTH-1:0]result       //the width of result may be short a little more  
);

parameter  WIDTH = 8;

assign result = data_A + data_B;

endmodule
