`timescale 1ns / 1ps
module module_ordinary(
    input Cm, PQm, Cc, PQc,
    input CarRatio,
    input clk,
    output reg [2 : 0]main_light_state, sub_light_state, p_main_light_state, p_sub_light_state,
    output reg [4 : 0]main_reset_time, sub_reset_time,
    output reg Source, Control, Cml, PQml, Ccl, PQcl,
    output reg [15 : 0]MainTime, SubTime, 
    output reg [ 7 : 0]MainColor, SubColor
);
    parameter REDT = 19, GREENT = 16, YELLOWT = 3, ONLINET = 0;
    parameter REDL =  1, GREENL =  2, YELLOWL = 3, ONLINEL = 4;
    parameter REDS =  0, GREENS =  1, YELLOWS = 2, ONLINES = 3, PAUSES = 4;
    parameter CLOCK_HZ = 5;
    
    reg main_time_temp, sub_time_temp;
    always @(negedge clk) begin
        case (main_light_state)
          ONLINES : begin
                main_light_state <= p_main_light_state;
                main_time_temp <= 1;
          end
          PAUSES : begin: pauss
                main_light_state <= p_main_light_state;
                main_time_temp <= 1;
          end
          REDS : begin
                main_reset_time = main_time_temp ? main_reset_time : REDT; // 设置剩余时间和下�??状�??
                main_time_temp = main_reset_time ? 1 : 0;
                main_light_state = main_reset_time ? REDS : GREENS;
                
                MainColor <= REDL; // 设置数码管显�??
                MainTime <= main_reset_time;
                
                clock mc1(clk, main_reset_time); // clock 模块控制每一秒减少一个剩余时�??
          end
          GREENS : begin 
                main_reset_time = main_time_temp ? main_reset_time : REDT;
                main_time_temp = main_reset_time ? 1 : 0;
                main_light_state = main_reset_time ? GREENS : YELLOWS;

                MainColor <= GREENL;
                MainTime <= main_reset_time;

                clock mc2(clk, main_reset_time);
          end
          YELLOWS : begin
                main_reset_time = main_time_temp ? main_reset_time : REDT;
                main_time_temp = main_reset_time ? 1 : 0;
                main_light_state = main_reset_time ? YELLOWS : REDS;

                MainColor <= YELLOWL;
                MainTime <= main_reset_time;

                clock mc3(clk, main_reset_time);
          end
        endcase

        case (sub_light_state)
          ONLINES : begin
                sub_light_state <= p_sub_light_state;
                sub_time_temp <= 1;
          end
          PAUSES : begin
                sub_light_state <= p_sub_light_state;
                sub_time_temp <= 1;
          end
          REDS : begin
                sub_reset_time = sub_time_temp ? sub_reset_time : REDT;
                sub_time_temp = sub_reset_time ? 1 : 0;
                sub_light_state = sub_reset_time ? REDS : GREENS;

                SubColor <= REDL;
                SubTime <= sub_reset_time;

                clock sc1(clk, sub_reset_time);
          end
          GREENS : begin
                sub_reset_time = sub_time_temp ? sub_reset_time : REDT;
                sub_time_temp = sub_reset_time ? 1 : 0;
                sub_light_state = sub_reset_time ? GREENS : YELLOWS;

                SubColor <= GREENL;
                SubTime <= sub_reset_time;

                clock sc2(clk, sub_reset_time);
          end
          YELLOWS : begin
                sub_reset_time = sub_time_temp ? sub_reset_time : REDT;
                sub_time_temp = sub_reset_time ? 1 : 0;
                sub_light_state = sub_reset_time ? YELLOWS : REDS;

                SubColor <= YELLOWL;
                SubTime <= sub_reset_time;

                clock sc2(clk, sub_reset_time);
          end
        endcase
        
    end
endmodule // module_ordinary