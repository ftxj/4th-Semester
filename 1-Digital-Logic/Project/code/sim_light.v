module sim_light();
    reg init_g, init_r, off_r;
    reg clk;
    reg ord_change, green_change, red_change, star_change;
    wire [2 : 0]LED16;
    wire [ 7 : 0]SIG_C, AN;
    wire [ 3 : 0]light_state;

    light m(init_g, init_r, off_r, clk, ord_change, green_change,
        red_change, star_change, LED16, SIG_C, AN, light_state);
    initial begin
        init_g <=0; init_r <= 0; off_r <= 1; clk <= 0;
        ord_change <= 0; green_change <= 0; red_change <= 0;
        star_change <=0;
        #20 off_r <= 0;
        #40 init_r <= 1;
        #60 init_r <= 0;
        #80 green_change <= 1;
        #140 green_change <= 0;
        #180 star_change <= 1;
        #300 star_change <= 1;
    end

    always begin 
        #5 clk = ~clk;
    end
endmodule // module_online