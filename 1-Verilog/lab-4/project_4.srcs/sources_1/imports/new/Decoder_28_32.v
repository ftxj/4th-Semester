`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/30 09:34:24
// Design Name: 
// Module Name: Decoder_28_32
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


module Decoder_28_32(
    input  wire [27:0]data_in,
	output wire [31:0]data_out
);

//initial data_out <= 0;

assign data_out[31:28] =  data_in/28'D10_000_000;
assign data_out[27:24] = (data_in/28'D1_000_000 )%4'D10;
assign data_out[23:20] = (data_in/28'D100_000 )  %4'D10;
assign data_out[19:16] = (data_in/28'D10_000 )   %4'D10;

assign data_out[15:12] = (data_in/28'D1_000 )    %4'D10;
assign data_out[11:8]  = (data_in/28'D100 )      %4'D10;
assign data_out[7:4]   = (data_in/28'D10 )       %4'D10;
assign data_out[3:0]   =  data_in                %4'D10;

endmodule
