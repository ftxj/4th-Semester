`timescale 1ns / 1ps
module main(
    input Online, Set, Reset, Peaks, Ten,
    input Cm, PQm, Cc, PQc,
    input [1 : 0]CarRatio,
    input clk,
    output  [2 : 0]LED16, LED17,
    output reg Source, Control, Cml, PQml, Ccl, PQcl,
    output  [ 7 : 0]SIG_C, AN, 
    output reg [ 3 : 0]control_state
);

    parameter OFF = 0, INIT = 1, ORD = 2, BUSY = 3, NIGHT = 4, PAUSE = 5, LINE = 6,
        ALLNOCAR = 7, MAINNOCAR = 8, SUBNOCAR = 9;

    //reg [3 : 0]control_state;
    //reg [2 : 0]main_light_state, sub_light_state, p_main_light_state, p_sub_light_state;
    wire [4 : 0]main_rest_time, sub_reset_time; 
    wire [5 : 0]main_led_state, sub_led_state;
    wire dis_main, dis_sub;

    reg [3 : 0]p_control_state, o_control_state;

    reg off_r, m_init_g, m_init_r, s_init_g,  s_init_r, yellow_r, ord_r, busy_r, online_r, pause_r, 
         double_g, double_red, usu_green, acc_r, man_clr;
    reg main_red_change, main_green_change, 
        sub_red_change, sub_green_change,
        star_change;
    

    light       main_light(m_init_g, m_init_r, off_r, clk, ord_r, online_r, 0,
        yellow_r, LED16, SIG_C, AN);
    light       sub_light(s_init_g, s_init_r, off_r, clk, ord_r, 0, online_r,
        yellow_r, LED17, SIG_C, AN);

    mod_time    main_led(m_init_g, m_init_r, off_r, pause_r, online_r, clk, ord_r,
        main_green_change, main_red_change, star_change,
        main_led_state, main_rest_time, dis_main);
    mod_time    sub_led (s_init_g, s_init_r, off_r, pause_r, online_r, clk, ord_r,
        sub_green_change,  sub_red_change,  star_change,
        sub_led_state,  sub_reset_time, dis_sub);

    display_time display(main_rest_time, sub_reset_time, 
        clk, dis_main, off_r, SIG_C, AN);

    initial begin
        control_state <= OFF; 
    end
    
    always @(negedge clk)
        case (control_state)
          OFF : begin
            Source <= 0; 
            off_r <= 1;  
            m_init_g <= 0; m_init_r <= 0;
            s_init_r <= 0; s_init_g <= 0;
            control_state <= !Reset ? OFF : INIT;
          end 

        INIT : begin
            Source <= 1;
            off_r <= 0;
            m_init_g <= 1; m_init_r <= 0;
            s_init_r <= 1; s_init_g <= 0;
            control_state <= !Reset ? OFF : ORD;
          end

        ORD : begin
            m_init_g <= 0; m_init_r <= 0;
            s_init_r <= 0; s_init_g <= 0;
            ord_r <= 0;
            busy_r <= 0;
            yellow_r <= 0;
            pause_r <= 0;
            online_r <= 0;
            p_control_state <= ORD;
            o_control_state <= ORD;
            control_state <= !Reset ? OFF : (
                    !Set ? PAUSE : (
                        Online ? LINE : (
                            Peaks ? BUSY : (
                                Ten ? NIGHT : (
                                    ORD)))));
          end
        BUSY : begin
            ord_r <= 0;
            yellow_r <= 0;
            pause_r <= 0;
            online_r <= 0;
            busy_r <= 1;
            p_control_state <= BUSY;
            o_control_state <= BUSY;
            control_state <= !Reset ? OFF : (
                    !Set ? PAUSE : (
                        Online ? LINE : (
                            !Peaks ? ORD : (
                                Ten ? NIGHT : ( 
                                    BUSY)))));
          end
        NIGHT : begin
            ord_r <= 0;
            busy_r <= 0;
            pause_r <= 0;
            online_r <= 0;
            yellow_r <= 1;
            p_control_state <= NIGHT;
            o_control_state <= NIGHT;
            control_state <= !Reset ? OFF : ( 
                    !Set ? PAUSE :(
                        Online ? LINE : (
                                Ten ? NIGHT : ( 
                                    INIT))));
            end
        PAUSE : begin
            ord_r <= 0;
            busy_r <= 0;
            yellow_r <= 0;
            online_r <= 0;
            pause_r <= 1;
            control_state <= !Reset ? OFF : (
                    !Set ? PAUSE : 
                        p_control_state);
            end
        LINE : begin
            ord_r <= 0;
            busy_r <= 0;
            yellow_r <= 0;
            pause_r <= 0;
            online_r <= 1;
            main_green_change <= 1;
            sub_red_change <= 1;
            p_control_state <= LINE;
            control_state <= !Reset ? OFF : ( 
                    !Set ? PAUSE :(
                        Online ? LINE : (
                            o_control_state)));
            end
        endcase    
endmodule