`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/21 09:34:55
// Design Name: 
// Module Name: decoder4_16_show
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


module decoder4_16_show(select,show_code);
    input  [3:0]select;          //选择控制
    output reg  [7:0]show_code; //输出的显示码，行为赋值必须要用寄存器reg类型
    
    always@(select)
        begin
            case(select)
                4'b0000:show_code[7:0]=8'b11000000;
                4'b0001:show_code[7:0]=8'b11111001;
                4'b0010:show_code[7:0]=8'b10100100;
                4'b0011:show_code[7:0]=8'b10110000;
                4'b0100:show_code[7:0]=8'b10011001;
                4'b0101:show_code[7:0]=8'b10010010;
                4'b0110:show_code[7:0]=8'b10000010;
                4'b0111:show_code[7:0]=8'b11111000;
                4'b1000:show_code[7:0]=8'b10000000;
                4'b1001:show_code[7:0]=8'b10011000;
                4'b1010:show_code[7:0]=8'b10001000;
                4'b1011:show_code[7:0]=8'b10000011;
                4'b1100:show_code[7:0]=8'b11000110;
                4'b1101:show_code[7:0]=8'b10100001;
                4'b1110:show_code[7:0]=8'b10000110;
                default:show_code[7:0]=8'b10001110;
            endcase
        end
        
endmodule
