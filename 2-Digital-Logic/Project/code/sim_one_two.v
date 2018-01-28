module sim_main();
    reg Online, Set, Reset, Peaks, Ten;
    reg Cm, PQm, Cc, PQc;
    reg [1 : 0]CarRatio;
    reg clk;
    wire [2 : 0]LED16, LED17;
    wire Source;
    wire [ 7 : 0]SIG_C, AN;
    wire [ 3 : 0]control_state;
    reg Police, AV;

    wire [ 6 : 0]main_rest_time, sub_rest_time;

    Main sim_main(clk, Online, Set, Reset, Peaks, Ten,Police, AV, 
     Cm, PQm, Cc, PQc, CarRatio, Source,
     LED16, LED17, SIG_C, AN, main_rest_time,sub_rest_time,
     control_state);
    initial begin
        Online = 0; Reset = 0; Ten = 0;
        Set = 0; Peaks <= 0; Cm = 1;clk = 0;
        PQm = 0; Cc = 1; PQc = 0; CarRatio = 0;
        AV = 0; Police = 0;
        #20 Reset = 1; #40 Set = 1;
        #100 Set = 0; #100 Set = 1;
        #2970 Online = 1; #300 Online = 0;

        #20 Peaks = 1; #100 CarRatio = 1;

        #2800 CarRatio = 0;
              Peaks = 0;
        #50 Cc = 0; #1200 Cc = 1;
        
        #20 Reset = 0;

        #100 Reset = 1; #100 Cc = 0;
        #500 PQm = 1; #800 PQm = 0;
        #200 Cc = 1; #500 Ten = 1;
        #500 Ten = 0;
        #500 Police = 1;
        #500 AV = 1;
    end
    always begin 
        #5 clk = ~clk;
    end
endmodule // module_online