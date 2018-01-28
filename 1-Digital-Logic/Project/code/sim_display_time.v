`timescale 1ns / 1ps
module sim_display_play();
    reg [4 : 0] main_rest_time, sub_rest_time;
    reg clk;
    reg dis, non;
    wire [7 : 0]SIG_C;
    wire [7 : 0]POS;
    
    display_time ddd(main_rest_time, sub_rest_time, clk, dis, non, SIG_C, POS);
    initial begin
        main_rest_time <= 0;
        sub_rest_time <= 0;
        clk <= 0;
        dis <= 0;
        non <= 0;

        #10 main_rest_time <= 13;
        #50 sub_rest_time <= 16;
    end

    always  begin
        #5 clk = ~clk;
    end
endmodule 