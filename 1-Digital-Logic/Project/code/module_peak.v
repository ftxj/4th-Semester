module module_peak(
    input Cm, PQm, Cc, PQc,
    input CarRatio,
    input clk,
    output reg [2 : 0]main_light_state, sub_light_state, p_main_light_state, p_sub_light_state,
    output reg [4 : 0]main_rest_time, sub_reset_time,
    output reg Source, Control, Cml, PQml, Ccl, PQcl,
    output reg [15 : 0]MainTime, SubTime, 
    output reg [ 7 : 0]MainColor, SubColor
);
    parameter REDT = 19, GREENT = 16, YELLOWT = 3, ONLINET = 0;
    parameter REDL =  1, GREENL =  2, YELLOWL = 3, ONLINEL = 4;
    parameter REDS =  0, GREENS =  1, YELLOWS = 2, ONLINES = 3, PAUSES = 4;
    parameter CLOCK_HZ = 5;

    always @(negedge clk) begin
        MainTime = 18;
        SubTime = 18;
        MainColor = 1;
        SubColor = 1;
    end
endmodule // module_peak