`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/30 11:10:31
// Design Name: 
// Module Name: Show_Number
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


module Show_Number(
    input clk,
	input wire [27:0]data_in,
	input wire [31:0]frequency_need,
	output reg [7:0]AN,
	output reg CA,CB,CC,CD,CE,CF,CG,DP
);

wire clk_need;              //控制脉冲
wire [31:0]data_out;        //此时应显示的数的8421BCD码
wire  [7:0]tube[7:0];       //8个元素，每个元素都是数码管的一个形态
reg   [7:0]tube_now;        //此时有效的数码管形态

Divider        D3(.clk(clk), .frequency_need(frequency_need), .clk_need(clk_need));
Decoder_28_32  D4(.data_in(data_in),  .data_out(data_out));
pattern        P1(.code(data_out[3:0]),   .patt(tube[0]));
pattern        P2(.code(data_out[7:4]),   .patt(tube[1]));
pattern        P3(.code(data_out[11:8]),  .patt(tube[2]));
pattern        P4(.code(data_out[15:12]), .patt(tube[3]));
pattern        P5(.code(data_out[19:16]), .patt(tube[4]));
pattern        P6(.code(data_out[23:20]), .patt(tube[5]));
pattern        P7(.code(data_out[27:24]), .patt(tube[6]));
pattern        P8(.code(data_out[31:28]), .patt(tube[7]));

initial 
    begin
	    AN = 8'b11111110;
	end
	
always @(posedge clk_need)
    begin
	    case(AN)
		    8'b11111110:begin
			            AN <= 8'b11111101;
						tube_now <= tube[2];end
            8'b11111101:begin
			            AN <= 8'b11111011;	
						tube_now <= tube[3];end
            8'b11111011:begin
			            AN <= 8'b11110111;
						tube_now <= tube[4];end
            8'b11110111:begin
			            AN <= 8'b11101111;
						tube_now <= tube[5];end
            8'b11101111:begin
			            AN <= 8'b11011111;
						tube_now <= tube[6];end
            8'b11011111:begin
			            AN <= 8'b10111111;
						tube_now <= tube[7];end
            8'b10111111:begin
			            AN <= 8'b01111111;
						tube_now <= tube[0];end
            default    :begin
			            AN <= 8'b11111110;		
						tube_now <= tube[1];end
        endcase		
        
        {DP,CG,CF,CE,CD,CC,CB,CA} <= tube_now; 		
	end
endmodule
