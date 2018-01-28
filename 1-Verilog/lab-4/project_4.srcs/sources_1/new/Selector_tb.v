`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/31 18:28:46
// Design Name: 
// Module Name: Selector_tb
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


module Selector_tb();

reg  [7:0]data_0;
reg  [7:0]data_1;
reg sel;
wire [7:0]result;

always #20 data_0 = $random % 9'b100000000;
always #20 data_1 = $random % 9'b100000000;
always #20 sel    = $random % 2'b10;

Selector #(8) S1(.data_1(data_1), .data_0(data_0), .sel(sel), .result(result));

endmodule