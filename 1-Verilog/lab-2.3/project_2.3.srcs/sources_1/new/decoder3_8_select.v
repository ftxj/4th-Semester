`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/21 09:45:47
// Design Name: 
// Module Name: decoder3_8_select
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


module decoder3_8_select(data_in,data_out);
    input [2:0]data_in;       //输入的数据，选择显示哪一个数码管
    output reg [7:0]data_out; //显示哪一个数码管，行为赋值必须要用寄存器reg类型
    
    always@(data_in)
        begin
            case(data_in)
            3'b000: data_out[7:0] =8'b11111110;
            3'b001: data_out[7:0] =8'b11111101;
            3'b010: data_out[7:0] =8'b11111011;
            3'b011: data_out[7:0] =8'b11110111;
            3'b100: data_out[7:0] =8'b11101111;
            3'b101: data_out[7:0] =8'b11011111;
            3'b110: data_out[7:0] =8'b10111111;
            default:data_out[7:0] =8'b01111111;
            endcase
        end
        
endmodule
