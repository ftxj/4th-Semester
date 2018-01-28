`timescale 1ns / 1ps
module clock(
    input clk,
    input [6 : 0]rest_time,
    output reg [6 : 0]next_time,
    input stop, dis, off_r
);
    
    parameter cycle = 1_0000_0000;
    //parameter cycle = 6;
    integer inc = 0;
    initial begin 
        inc <= 0;
    end 
    always @(posedge clk) begin
        if(off_r) begin inc <= 0; next_time <= 0; end
        else if(dis) begin next_time <= 21; end
        else if(inc == cycle) begin
            inc <= 0;
            next_time <= (rest_time == 0) ? 0 
                : (rest_time - 1);
        end
        else if(stop) begin inc <= 0; next_time <= rest_time; end
        else begin
             inc <=  inc + 1;
             next_time <= rest_time;
        end
    end
endmodule // main_clock 