`timescale 1ns / 1ps
module TrafficControl(
    input init_g, init_r, off_r, pause_r, online, polic,
    input clk,this_man, other_man,
    input green_change, red_change, star_change,
    output reg [6 : 0]led_state,
    input [6 : 0]rest_time,
    output reg [2 : 0]light_state,
    output reg dis,
    output reg red_s, yellow_s, green_s, init_s, save_s, five_time, eight_time,
    output reg [6 : 0]p_rest_time
);

    localparam OFF = 0, RED = 1, GREEN = 2, YELLOW = 3, ORED = 4, OGREEN = 5, 
        DOSAVE = 6, DOLOAD = 7, SAVE = 8, DORED = 9, DOGREEN = 10, DOYELLOW = 11, 
        DO_OGREEN = 12, DO_ORED = 13, ERROR = 14, DOSTAR = 15, STAR = 16, 
        LOAD = 17,  WAIT_DORED = 18, WAIT_DOGREEN = 19, WAIT_DOYELLOW = 20, 
        WAIT_ORED = 21, WAIT_OGREEN = 22, WAIT_SAVE = 23, DOINIT = 24, INIT = 25,
        WAIT_INIT = 26, ALLRED = 27, MAN_GREEN = 28, MAN_RED = 29, DOMAN_RED = 30,
        DOMAN_GREEN = 31, FIVE_GREEN = 32, DO_FIVE_GREEN = 33, DO_EI_RED = 34, 
        EI_RED = 35, THREE_Y = 36, DO_THREE_Y = 37, IMP = 38, DOALLRED = 39,
        GREENPASS = 40, REDPASS = 41, YELLOWPASS = 42;
    localparam  RED_C = 0, YELLOW_C = 1, GREEN_C = 2, GREEN_U = 3, 
        RED_U = 4, STAR_U = 5, OFF_U = 6;
        
    reg [5 : 0] p_led_state;
    reg [5 :0] temp_state;
    reg man = 0, order = 0;


    initial begin
        p_rest_time <= 21;
        led_state <= OFF;
    end

always @(posedge clk) begin
        case (led_state)
            OFF :   begin 
                        light_state <= OFF_U;
                        led_state <= !off_r? INIT : OFF; 
                    end 
            INIT :  begin
                        init_s  <= 0;
                        led_state <= DOINIT;
                    end

           DOINIT : begin
                        init_s  <= 0;
                        led_state <= init_g? DOGREEN : (
                                init_r? DORED : INIT);
                    end
            DORED : begin
                        dis <= 0;
                        red_s <= 1;
                        led_state <= REDPASS;
                    end
       WAIT_DORED : begin
                        red_s <= 0;
                        led_state <= RED;
                    end  
          DOGREEN : begin
                        dis <= 0;
                        green_s <= 1;
                        led_state <= GREENPASS;
                    end
        GREENPASS : begin
                        led_state <= WAIT_DOGREEN;
                    end
        REDPASS  :  begin
                        led_state <= WAIT_DORED;
                    end
        YELLOWPASS : begin
                        led_state <= WAIT_DOYELLOW;
                    end
    WAIT_DOGREEN :  begin
                        green_s <= 0;
                        led_state <= GREEN;
                    end
        DOYELLOW :  begin
                        dis <= 0;
                        yellow_s <= 1;
                        led_state <= YELLOWPASS;
                    end    
   WAIT_DOYELLOW :   begin
                        yellow_s <= 0;
                        led_state <= YELLOW;
                    end                    
            RED :   begin
                        light_state <= RED_C;
                        temp_state <= RED;
                        led_state <= off_r? OFF : ( pause_r? RED : (online? DOSAVE : (
                            polic? DOALLRED : (
                            star_change? DOSTAR : (
                                !rest_time? (green_change? DO_OGREEN : DOGREEN) 
                                    : RED)))));
                    end
            GREEN : begin
                        light_state <= GREEN_C;
                        temp_state <= GREEN;
                        led_state <= off_r? OFF : (pause_r? GREEN : (online? DOSAVE : (
                            polic? DOALLRED : (
                            star_change? DOSTAR : (
                                    !rest_time? DOYELLOW : GREEN)))));
                    end
           YELLOW : begin
                        light_state <= YELLOW_C;
                        temp_state <= YELLOW;
                        led_state <= off_r? OFF : (pause_r? YELLOW :(online? DOSAVE : (
                            polic? DOALLRED : (
                            star_change? DOSTAR : (
                                !rest_time? (red_change? DO_ORED : DORED)
                                    : YELLOW)))));
                    end
           DOSAVE : begin
                        p_led_state <= temp_state;
                        p_rest_time <= rest_time;
                        led_state <= IMP;
                    end
            IMP   : begin
                        dis <= 1;
                        light_state <= green_change? GREEN_C : RED_C;
                        led_state <= online? IMP : DOLOAD;
                    end
           DOSTAR : begin
                        led_state <= STAR;
                    end
           DOLOAD : begin
                        dis <= 0;
                        led_state <= WAIT_SAVE;
                        save_s <= 1;
                    end
        WAIT_SAVE : begin
                        save_s <= 0;
                        led_state <= p_led_state;
                    end
        DO_OGREEN : begin
                        order <= 1;
                        led_state <= WAIT_OGREEN;
                    end 
      WAIT_OGREEN : begin
                        led_state <= OGREEN;
                    end   
         DO_ORED  : begin
                        order <= 0;
                        led_state <= WAIT_ORED;
                    end
       WAIT_ORED :  begin
                        led_state <= ORED;
                    end
            STAR :  begin
                        dis <= 1;
                        light_state <= STAR_U;
                        temp_state <= STAR;
                        led_state <= off_r? OFF : (
                            polic? DOALLRED : (
                            !star_change? WAIT_INIT : STAR));
                    end

        DOALLRED  : begin
                        led_state <= ALLRED;
                    end
           ALLRED : begin
                        dis <= 1;
                        light_state <= RED_C;
                        temp_state <= ALLRED;
                        led_state <= off_r? OFF :(
                            !polic? WAIT_INIT : ALLRED);
                    end 

       WAIT_INIT  :  begin
                        dis <= 0;
                        led_state <= (init_g || init_r)? INIT : 
                            (star_change? DOSTAR : WAIT_INIT);
                    end
         OGREEN  :  begin
                        dis <= 1;
                        light_state <= GREEN_C;
                        temp_state <= OGREEN;
                        led_state <= off_r? OFF : ( pause_r? OGREEN : 
                        (polic? DOALLRED : (
                            (!green_change? DOGREEN : (
                                this_man? DO_FIVE_GREEN :
                                OGREEN)))));
                    end
            ORED :  begin
                        dis <= 1;
                        light_state <= RED_C;
                        temp_state <= ORED;
                        led_state <= off_r? OFF : (pause_r? ORED : 
                            (polic? DOALLRED : (
                            (!red_change? DORED  : (
                                other_man? DO_EI_RED : 
                                    ORED)))));
                    end

  DO_FIVE_GREEN  :  begin
                        dis <= 0;
                        led_state <= FIVE_GREEN;
                        five_time <= 1;
                    end
     FIVE_GREEN  :  begin
                        light_state <= GREEN_C;
                        led_state <= !rest_time? 
                            DO_THREE_Y : FIVE_GREEN; 
                        five_time <= 0;
                    end   
    DO_THREE_Y   :  begin
                        dis <= 0;
                        led_state <= THREE_Y;
                        yellow_s <= 1;
                    end
       THREE_Y   :  begin
                        yellow_s <= 0;
                        light_state <= YELLOW_C;
                        led_state <= !rest_time? 
                            (order? DO_EI_RED : DO_ORED)
                             : THREE_Y; 
                    end
      DO_EI_RED  :  begin
                        dis <= 0;
                        eight_time <= 1;
                        led_state <= EI_RED;
                    end
        EI_RED   :  begin
                        light_state <= RED_C;
                        eight_time <= 0;
                        led_state <= !rest_time? 
                            (order? DO_OGREEN : DO_FIVE_GREEN)
                                : EI_RED;
                    end
          ERROR  :  begin
                        led_state <= green_change? DO_OGREEN : (
                                red_change? DO_ORED : ERROR);
                    end
          default:  begin
                        led_state <= INIT;
                    end 
        endcase
end
endmodule