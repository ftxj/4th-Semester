module sim_main();
    reg Online, Set, Reset, Peaks, Ten, Police, AV;
    reg Cm, PQm, Cc, PQc;
    reg [1 : 0]CarRatio;
    reg clk;

    wire Source;
    wire [ 3 : 0] control_state;
    //wire [ 7 : 0] SIG_C, AN;
    wire off_r, m_init_g, m_init_r, s_init_g,  s_init_r, yellow_r, 
        ord_r, busy_r, online_r, pause_r, polic;
    wire main_red_change, main_green_change,
        sub_red_change, sub_green_change,
        main_more, sub_more, main_man, sub_man,
        star_change;
    wire [3 : 0]p_control_state, o_control_state;


    maincontrol BGY(Online, Set, Reset, Peaks,Ten,Police, AV,
        Cm, PQm, Cc, PQc,
        CarRatio,
        clk,
        Source,
        //SIG_C, AN,
        control_state,
        off_r, m_init_g, m_init_r, s_init_g,  s_init_r, yellow_r, 
        ord_r, busy_r, online_r, pause_r, polic,
        main_red_change, main_green_change,
        sub_red_change, sub_green_change,
        main_more, sub_more, main_man, sub_man,
        star_change,p_control_state, o_control_state);
    initial begin
        Online <= 0; Set <= 0; Reset <= 0;
        CarRatio <= 0; Peaks <= 0;Ten <= 0;
        Police <= 0; AV <= 0; Cm <= 1;
        PQm <= 0; Cc <= 1; PQc <= 0; clk <= 0;
        #20 Reset <= 1;
        #20 Set <= 1;
        #20 Online <= 1;
        #20 Set <= 0;
        #20 Online <= 0;
        #20 Set <= 1;
        #20 Peaks <= 1;
        #20 CarRatio <= 1;
        #20 Peaks <= 0;
        #10 Cc <= 0;
        #20 PQm <= 1;
        #10 PQm <= 0;
        #20 Ten <= 1;
        #20 Ten <= 0;
        #20 Police <= 1;
        #20 Police <= 0;
        #20 AV <= 1;
        #20 Online <= 1;
        #20 Reset <= 0;
            AV <= 0;
    end
    always  begin
        #5 clk = ~clk;
    end
endmodule // sim_main   