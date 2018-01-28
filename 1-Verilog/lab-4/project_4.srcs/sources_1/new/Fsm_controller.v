`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/31 20:20:38
// Design Name: 
// Module Name: Fsm_controller
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


module Fsm_controller(
	input clock,start,rst,
	input next_zero,
	output wire ld_sum, ld_next,sum_sel,next_sel,a_sel,
	output wire done
);

reg [3:0]state;
reg [5:0]temp_save;

parameter START       = 4'b1000,
		  COMPUTE_SUM = 4'b0100,
		  GET_NEXT    = 4'b0010,
		  DONE        = 4'b0001;
		  
initial state = START;

assign {ld_sum,ld_next,sum_sel,next_sel,a_sel,done} = temp_save;

always @(posedge clock)
	begin
		if(rst)
			begin
				state     <= START;
				temp_save <= 6'b000000; 
			end
		else
			case(state)
				START:begin
						if(start == 0)
						    begin
								state     <= START;
								temp_save <= 6'b000000; 
							end
						else
							begin
								state     <= COMPUTE_SUM;
								temp_save <= 6'b101110; 
							end
					  end
				COMPUTE_SUM:begin
								state     <= GET_NEXT;
								temp_save <= 6'b011100; 
					  end
				GET_NEXT:begin
				        if(next_zero == 0)
						    begin
								state     <= COMPUTE_SUM;
								temp_save <= 6'b101110; 
							end
						else
							begin
								state     <= DONE;
								temp_save <= 6'b000001; 
							end
					  end
				DONE:begin
				        if(start == 0)
						    begin
								state     <= START;
								temp_save <= 6'b000000; 
							end
						else
							begin
								state     <= DONE;
								temp_save <= 6'b000001; 
							end
					  end
				
			endcase
	end
	
endmodule
