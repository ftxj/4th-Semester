`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/31 20:50:44
// Design Name: 
// Module Name: Topest
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


module Topest(
    input clk,
	input clock,start,reset,
	output [6:0]part_of_sum_out,
	output done,
	output [7:0]AN,
	output CA,CB,CC,CD,CE,CF,CG,DP
);

wire [31:0]sum_out;
wire ld_sum, ld_next,sum_sel,next_sel,a_sel,next_zero;

assign part_of_sum_out = sum_out[6:0];

Show_Number Show1(
.clk(clk),
.data_in(sum_out[27:0]),
.frequency_need(2000),
.AN(AN),
.CA(CA),
.CB(CB),
.CC(CC),
.CD(CD),
.CE(CE),
.CF(CF),
.CG(CG),
.DP(DP)
);
Fsm_controller F1(
.clock(clock),
.start(start),
.rst(reset),
.next_zero(next_zero),
.ld_sum(ld_sum),
.ld_next(ld_next),
.sum_sel(sum_sel),
.next_sel(next_sel),
.a_sel(a_sel),
.done(done)
);
Datapath_top D1(
.ld_sum(ld_sum),
.ld_next(ld_next),
.sum_sel(sum_sel),
.next_sel(next_sel),
.a_sel(a_sel),
.clock(clock),
.reset(reset),
.next_zero(next_zero),
.sum_out(sum_out)
);

endmodule

