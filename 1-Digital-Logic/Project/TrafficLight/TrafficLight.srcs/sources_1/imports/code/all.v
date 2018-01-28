`timescale 1ns / 1ps
module Main(
    input clk,
    input Online, Set, Reset, Peaks, Ten, Police, AV,
    input Cm, PQm, Cc, PQc,
    input [1 : 0]CarRatio,
    output  Source,
    output  [ 2 : 0]LED16, LED17,
    output  [ 7 : 0]SIG_C, AN, 
    output  [ 3 : 0]control_state
);
    //主次干道公用信号
    wire [3 : 0]p_control_state, o_control_state;
    wire [2 : 0] n1, n2;
    wire off_r,yellow_r, ord_r, busy_r, online_r, pause_r, polic;
    wire star_change;
    
    //主干道模块�?�信信号
    wire [6 : 0]main_rest_time, main_next_time;
    wire [6 : 0]main_p_rest_time; 
    wire [6 : 0]main_led_state;
    wire [2 : 0]main_light_state;
    wire dis_main;
    wire m_init_g, m_init_r;
    wire main_red_change, main_green_change, main_more, main_man;
    wire main_eight_time, main_five_time, main_red_s, main_yellow_s, 
        main_green_s, main_init_s, main_save_s;

    //次干道模块�?�信信号
    wire [6 : 0]sub_reset_time, sub_next_time;
    wire [6 : 0]sub_p_rest_time; 
    wire [6 : 0]sub_led_state;
    wire [2 : 0]sub_light_state;
    wire dis_sub;
    wire s_init_g,  s_init_r;
    wire sub_red_change, sub_green_change, sub_more, sub_man;
    wire sub_eight_time, sub_five_time, sub_red_s, sub_yellow_s, 
            sub_green_s, sub_init_s, sub_save_s;
    
    //主控制模�?
    maincontrol MainControl(Online, Set, Reset, Peaks, Ten, Police,AV,
        Cm, PQm, Cc, PQc, CarRatio, clk, Source, SIG_C, AN, 
        control_state, off_r, m_init_g, m_init_r, s_init_g,  
        s_init_r, yellow_r, ord_r, busy_r, online_r, pause_r, polic, 
        main_red_change, main_green_change, sub_red_change, sub_green_change, 
        main_more, sub_more, main_man, sub_man, star_change);
    //主干道交通灯控制模块
    TrafficControl    main_traffic(m_init_g, m_init_r, off_r, pause_r, 
        online_r,polic, clk, main_man, sub_man, main_green_change, 
        main_red_change, star_change, main_led_state, main_rest_time, 
        main_light_state, dis_main, main_red_s, main_yellow_s, main_green_s, 
        main_init_s, main_save_s, main_five_time, main_eight_time, 
        main_p_rest_time);
    //次干道交通灯控制模块
    TrafficControl    sub_traffic (s_init_g, s_init_r, off_r, pause_r,
        online_r,polic, clk, sub_man, main_man, sub_green_change,
        sub_red_change,  star_change, sub_led_state,  sub_reset_time, 
        sub_light_state, dis_sub, sub_red_s, sub_yellow_s, sub_green_s, 
        sub_init_s, sub_save_s, sub_five_time, sub_eight_time, 
        sub_p_rest_time);
    //主干道时钟控制模�?
    traffic_time main_time(main_red_s, main_yellow_s, main_green_s, 
        main_init_s, main_save_s, main_five_time, main_eight_time,clk, 
        pause_r, off_r, busy_r, main_more, sub_more, 
        main_rest_time, main_p_rest_time, main_next_time);
    //次干道时钟控制模�?
    traffic_time sub_time(sub_red_s, sub_yellow_s, sub_green_s, 
        sub_init_s, sub_save_s, sub_five_time, sub_eight_time,clk, 
        pause_r, off_r, busy_r, sub_more, main_more,
        sub_reset_time, sub_p_rest_time, sub_next_time);
    //主干道LED显示模块
    light  main_led(clk, main_light_state, LED17);
    //次干道LED显示模块
    light  sub_led(clk, sub_light_state, LED16);
    //数码管显示模�?
    display_time number_display(main_rest_time, sub_reset_time, 
        clk, dis_main, off_r, n1, n2, SIG_C, AN);
    //附加功能模块
    man_walk main_man_walk(clk, main_rest_time, main_led_state,sub_man,n1);
    man_walk sub_man_walk(clk, sub_reset_time, sub_led_state,main_man, n2);

endmodule