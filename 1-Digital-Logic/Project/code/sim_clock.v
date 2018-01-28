module sim_traffictime();
    reg red_s, yellow_s, green_s, init_s, save_s;
    reg five_time, eight_time;
    reg clk;
    reg [4 : 0]rest_time;
    wire [4 : 0]next_time;
    reg stop, dis;

    clock cl(clk, rest_time, next_time, stop, dis);
    initial begin
        clk <= 0;
        rest_time <= 0;
        stop <= 0;
        dis <= 0;

        #50 rest_time <= 10;
    end

    always begin
        #5 clk = ~clk;
    end
endmodule // sim_