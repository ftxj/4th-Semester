`timescale 1ns / 1ps
module sim_clock();
    reg init_g, init_r, off_r, pause_r, online;
    reg clk;
    reg ord_change, green_change, red_change, star_change;
    //wire [7 : 0]SIG_C;
    //wire [3 : 0]AN;
    wire [5 : 0]led_state, p_led_state;
    wire [4 : 0]rest_time, p_rest_time;
    wire [4 : 0]next_time;
    wire load, stor;
    wire red_c, green_c, yellow_c, do_store, do_online;
    mod_time t(init_g, init_r, off_r, pause_r,online, 
        clk,
        ord_change, green_change, red_change, star_change,
        //SIG_C, AN, 
        led_state,
        rest_time, next_time);
    initial begin
        init_g <= 0; init_r <= 0; off_r <= 0;
        pause_r <= 0; clk <= 0; ord_change <= 0;
        green_change <= 0; red_change <= 0;
        star_change <= 0; online <= 0;
        #60 init_r = 1;

        #20 init_r = 1;
        #40 init_r = 0;

        #1000 online = 1;
        green_change = 1;
        
        #1000 green_change = 0;
        online = 0;
        
        #1000 pause_r = 1;
        #1000 pause_r = 0;

        #1000 star_change = 1;
    end

    always begin
        #5 clk = ~clk;
    end
endmodule // sim_clock