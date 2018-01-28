`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/18 17:10:27
// Design Name: 
// Module Name: pattern
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


module pattern(
code ,patt
    );
input [3:0]code;
output reg [7:0]patt;
    
always @(code)
begin
      case(code)
      0:patt = 8'b11000000;
      1:patt = 8'b11111001;
      2:patt = 8'b10100100;
      3:patt = 8'b10110000;
      4:patt = 8'b10011001;
      5:patt = 8'b10010010;
      6:patt = 8'b10000010;
      7:patt = 8'b11111000;
      8:patt = 8'b10000000;
      9:patt = 8'b10011000;
      10:patt = 8'b10001000;
      11:patt = 8'b10000011;
      12:patt = 8'b11000110;
      13:patt = 8'b10100001;
      14:patt = 8'b10000110;
      default:patt = 8'b10001110;
      endcase
end    
    
endmodule
