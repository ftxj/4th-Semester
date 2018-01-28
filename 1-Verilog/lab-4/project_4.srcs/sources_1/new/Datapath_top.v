`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/31 19:43:11
// Design Name: 
// Module Name: Datapath_top
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


module Datapath_top(
	input ld_sum, ld_next, sum_sel,
	input next_sel, a_sel,clock,reset,
    output next_zero,
    output [31:0]sum_out
);

wire [31:0]result_A2,result_A3;
wire [31:0]result_S2,result_S3,result_S4;
wire [31:0]result_L2,result_L3;
wire [31:0]data_M2;

Adder      #(32) A2(.data_A(result_L2), .data_B(data_M2), .result(result_A2) );
Selector   #(32) S2(.data_1(result_A2), .data_0(0), .sel(sum_sel), .result(result_S2));
Latch      #(32) L2(
.clock(clock),
.reset(reset),
.load(ld_sum),
.data(result_S2),
.result(result_L2)
);
Memory     #(32) M2(.address(result_S4), .data(data_M2));
Selector   #(32) S3(.data_1(data_M2), .data_0(0), .sel(next_sel), .result(result_S3));
Latch      #(32) L3(
.clock(clock),
.reset(reset),
.load(ld_next),
.data(result_S3),
.result(result_L3)
);
Adder      #(32) A3(.data_A(1), .data_B(result_L3), .result(result_A3) );
Selector   #(32) S4(.data_1(result_A3), .data_0(result_L3), .sel(a_sel), .result(result_S4));
Comparator #(32) C2(.data(result_S3), .iszero(next_zero));

assign sum_out = result_L2;

endmodule

