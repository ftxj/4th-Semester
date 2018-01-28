`timescale 1ns / 1ps
module traffic_time(
    input red_s, yellow_s, green_s, init_s, save_s,
    input five_time, eight_time, 
    input clk, pause_r, off_r, busy_r, more, less,
    output reg [6 : 0] rest_time,
    input [ 6 : 0] p_rest_time,
    output [ 6 : 0] next_time
);
    // next_time为当前时间减一秒
    //wire [6 : 0]next_time;
    //clock子模块，每隔一秒钟将rest_time的值减一赋值给next_time
    clock watch(clk, rest_time, next_time, pause_r, 0, off_r);
    
    //可以使时钟发生变化的信号有如下，初始化信号init_s，回到之前状态save_s,
    //一般情况变红信号 red_s，变绿信号green_s，变黄信号yellow_s，
    //行人通过请求绿灯信号five_time，以及相配套的红灯信号eight_time
    //若这些信号都暂时不存在，则执行时钟循环，将减一秒的值赋值给它
    always @(*) begin
        if(init_s) rest_time <= 10;
        else if(save_s) rest_time <= p_rest_time;
        else if(red_s) rest_time <= busy_r? (less? 35 : 19) : 19;
        else if(green_s) rest_time <= busy_r? (more? 32 : 16) : 16;
        else if(yellow_s) rest_time <= 3;
        else if(five_time) rest_time <= 5;
        else if(eight_time) rest_time <= 8;
        else rest_time <= next_time;
    end
endmodule