`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/31 18:08:26
// Design Name: 
// Module Name: Adder_tb
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


module Adder_tb();

reg  [7:0]data_A;
reg  [7:0]data_B;
wire [7:0]result;

always #20 data_A = $random % 9'b100000000;
always #20 data_B = $random % 9'b100000000;

Adder #(8) A1(.data_A(data_A), .data_B(data_B), .result(result));

endmodule
