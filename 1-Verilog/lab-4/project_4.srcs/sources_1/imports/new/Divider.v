`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/30 08:37:55
// Design Name: 
// Module Name: Divider
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


module Divider(
    input clk,
    input  wire [31:0]frequency_need,
	output reg clk_need
);

parameter frequency_before = 32'D100_000_000;       //ԭʼƵ��
reg [31:0] counter;
//parameter frequency_need   = 200;               //��Ҫ��Ƶ��
wire  [31:0]N;//��������

assign N = (frequency_before/frequency_need) / 2; 
initial counter  = 0;
initial clk_need = 0;                   //�������

always @(posedge clk)
    begin
        counter <= counter +1; 
		if(counter == N-1)                 //����N/2�κ�ת
		    begin
			    clk_need <= ~clk_need;
                counter  <=  0; 				
			end
	end	

endmodule