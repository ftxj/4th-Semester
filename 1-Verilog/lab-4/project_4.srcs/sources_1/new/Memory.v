`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/31 19:13:59
// Design Name: 
// Module Name: Memory
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


module Memory(
    input  wire [WIDTH-1:0]address,
    output wire  [WIDTH-1:0]data
);

parameter  WIDTH = 8;

reg [WIDTH-1:0]ram [15:0];

initial 
	begin 
		ram[0] =  8'H00000003;
		ram[1] =  8'H00000002;
		ram[2] =  8'H00000000;
		ram[3] =  8'H00000007;
		ram[4] =  8'H00000004;
		ram[5] =  8'H00000000;
		ram[6] =  8'H00000000;
		ram[7] =  8'H0000000b;
		
		ram[8]  =  8'H00000006;
		ram[9]  =  8'H00000000;
		ram[10] =  8'H00000000;
		ram[11] =  8'H00000000;
		ram[12] =  8'H00000008;
		ram[13] =  8'H00000000;
		ram[14] =  8'H00000000;
		ram[15] =  8'H00000000;
	end

assign data = ram[address];
	
endmodule
