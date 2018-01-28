`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/31 18:39:45
// Design Name: 
// Module Name: Latch_tb
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


module Latch_tb();

reg  [7:0]data;
reg clock,reset,load;
wire [7:0]result;

always #20 data = $random % 9'b100000000;
always #20 reset    = $random % 2'b10;
always #20 load     = $random % 2'b10;
always #20 clock    = $random % 2'b10;

Latch #(8) L1(
.data(data),
.clock(clock), 
.reset(reset),
.load(load),
.result(result));

endmodule
