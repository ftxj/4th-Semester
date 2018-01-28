`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/21 09:56:22
// Design Name: 
// Module Name: top
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


module top(SW,LED,AN,SEG);
    input [15:0]SW;
    input [15:0]LED;
    output [7:0]AN;
    output [7:0]SEG;
    
    decoder3_8_select d1(.data_in(SW[15:13]), .data_out(AN[7:0]));
    decoder4_16_show  d2(.select(SW[3:0]),    .show_code(SEG[7:0]));
    
    assign LED[15:0] = SW[15:0];
    
endmodule
