`timescale 1ns / 1ps
module maincontrol(
    input Online, Set, Reset, Peaks, Ten, Police, AV,
    input Cm, PQm, Cc, PQc,
    input [1 : 0]CarRatio,
    input clk,
    output reg Source,
    output [ 7 : 0]SIG_C, AN, 
    output reg [ 3 : 0]control_state,
    output reg off_r, m_init_g, m_init_r, s_init_g,  s_init_r, yellow_r, 
        ord_r, busy_r, online_r, pause_r, polic,
    output reg main_red_change, main_green_change,
        sub_red_change, sub_green_change,
        main_more, sub_more, main_man, sub_man,
        star_change,
    output reg [3 : 0]p_control_state, o_control_state
);

    //定义状�?�，依次�? 关机，初始化，忙碌，夜间，暂停，Online, 交警模式
    localparam OFF = 0, INIT = 1, ORD = 2, BUSY = 3, NIGHT = 4, 
        PAUSE = 5, LINE = 6, POL = 10;
    
    initial begin
        control_state <= OFF; 
    end

    always @(posedge clk)
        case (control_state)
        //关机状�?�，输出关机信号
          OFF : begin
                    Source <= 0;  off_r <= 1;  
                    m_init_g <= 0; m_init_r <= 0;
                    s_init_g <= 0; s_init_r <= 0;
                    control_state <= (AV | !Reset) ? OFF : INIT;
                end 
        // 初始化状态，输出主干道绿色信号，次干道红色信�?
        INIT  : begin
                    Source <= 1; off_r <= 0;
                    m_init_g <= 1; m_init_r <= 0;
                    s_init_r <= 1; s_init_g <= 0;
                    main_green_change <= 0;
                    main_red_change <= 0;
                    sub_red_change <= 0;
                    sub_green_change <= 0;
                    control_state <= (AV | !Reset) ? OFF : ORD;
                end
        // �?般工作状态，可以进行常绿常红切换
        ORD :   begin
                    ord_r <= 0;
                    main_red_change <= (!Cm && Cc)? 1 : 0;
                    main_green_change <= !Cc? 1 : 0;
                    sub_green_change <= (!Cm && Cc)? 1 : 0;
                    sub_red_change <= !Cc? 1 : 0; 
                    main_man <= PQm? 1 : 0;
                    sub_man <= PQc? 1 : 0;
                    busy_r <= 0; yellow_r <= 0;
                    pause_r <= 0; online_r <= 0;
                    polic <= 0; star_change <= 0;
                    p_control_state <= ORD;
                    o_control_state <= ORD;
                    control_state <= (AV | !Reset)? OFF : (
                            !Set ? PAUSE : (
                                Online ? LINE : (
                                    Police? POL : (
                                        Peaks ? BUSY : (
                                            Ten ? NIGHT : (
                                                ORD))))));
                end
        //忙碌状�?�，根据输入的汽车信号给绿灯更多或�?�红灯更多信�?
        BUSY : begin
                    ord_r <= 0; yellow_r <= 0;
                    pause_r <= 0; online_r <= 0;
                    busy_r <= 1; off_r <= AV? 1 : 0;
                    polic <= 0;
                    main_more <= (CarRatio == 2) ? 1 : 0;
                    sub_more <= (CarRatio == 1) ? 1 : 0;                
                    main_red_change <= 0;
                    main_green_change <= 0;
                    sub_green_change <= 0;
                    sub_red_change <= 0; 
                    main_man <= 0; sub_man <= 0;
                    p_control_state <= BUSY;
                    o_control_state <= BUSY;
                    control_state <= (AV | !Reset) ? OFF : (
                            !Set ? PAUSE : (
                                Online ? LINE : (
                                    Police? POL : (
                                    !Peaks ? ORD : (
                                        Ten ? NIGHT : ( 
                                            BUSY))))));
                end
        // 夜间模式，夜间信号为1�? 其余�?0�?
        NIGHT : begin
                    m_init_g <= 0; m_init_r <= 0;
                    s_init_r <= 0; s_init_g <= 0;
                    main_green_change <= 0;
                    main_red_change <= 0;
                    polic <= 0;
                    off_r <= AV? 1 : 0;
                    sub_red_change <= 0;
                    sub_green_change <= 0;
                    ord_r <= 0; busy_r <= 0;
                    pause_r <= 0; online_r <= 0;
                    yellow_r <= 1; star_change <= 1;
                    p_control_state <= NIGHT;
                    o_control_state <= NIGHT;
                    control_state <= (AV | !Reset) ? OFF : ( 
                            !Set ? PAUSE :(
                                Online ? LINE : (
                                    Police? POL : (
                                        Ten ? NIGHT : ( 
                                            INIT)))));
                end
        // 暂停模式�? 置暂停信号为1
        PAUSE : begin
                    pause_r <= 1;
                    control_state <= (AV | !Reset) ? OFF : (
                            !Set ? PAUSE : 
                                p_control_state);
                end
        // Online模式，主干道常绿、次干道常红、online信号�?1，其余为0
        LINE : begin
                    ord_r <= 0;busy_r <= 0;
                    yellow_r <= 0;polic <= 0;
                    pause_r <= 0;off_r <= AV? 1 : 0;
                    online_r <= 1;
                    main_green_change <= 1;
                    main_red_change <= 0;
                    sub_red_change <= 1;
                    sub_green_change <= 0;
                    p_control_state <= LINE;
                    control_state <= (AV | !Reset) ? OFF : ( 
                            !Set ? PAUSE :(
                                Online ? LINE : (
                                    o_control_state)));
                end
        // 交警模式，输出polic信号�?1，其余信号置0
        POL :   begin
                    ord_r <= 0;busy_r <= 0;
                    yellow_r <= 0;pause_r <= 0;
                    off_r <= AV? 1 : 0;
                    online_r <= 0;polic <= 1;
                    main_green_change <= 0;
                    main_red_change <= 0;
                    sub_red_change <= 0;
                    sub_green_change <= 0;
                    p_control_state <= POL;
                    o_control_state <= POL;
                    control_state <= (AV | !Reset) ? OFF : ( 
                            !Set ? PAUSE :(
                                Online ? LINE : (
                                    Police ? POL : (
                                        Ten? NIGHT : (
                                        INIT)))));
                end
        // 处理无效状�?�，避免无法自启
    default:    begin
                    control_state <= OFF;
                end
        endcase    
endmodule