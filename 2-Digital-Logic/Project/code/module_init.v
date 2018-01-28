module module_init(
    output reg Source,   
    output reg [15 : 0]MainTime, SubTime, 
    output reg [ 7 : 0]MainColor, SubColor,
    output reg [ 2 : 0]main_light_state, sub_light_state,
    output reg [ 4 : 0]main_rest_time, sub_reset_time
);
    parameter REDT = 19, GREENT = 16, YELLOWT = 3, ONLINET = 0;
    parameter REDL =  1, GREENL =  2, YELLOWL = 3, ONLINEL = 4;
    parameter REDS =  0, GREENS =  1, YELLOWS = 2, ONLINES = 3, PAUSES = 4;
    parameter CLOCK_HZ = 5;
    
    initial begin
      Source <= 1; // 开关灯打开

      MainTime <= GREENT; // 设置数码管
      SubTime <= REDT;
      MainColor <= GREENL;
      SubColor <= REDL;

      main_light_state <= GREENS; // 设置灯状态
      sub_light_state <= REDS;
      
      main_rest_time <= GREENT; // 设置剩余时间
      sub_reset_time <= REDT;
    end
endmodule // module_init