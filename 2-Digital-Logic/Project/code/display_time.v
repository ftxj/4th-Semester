`timescale 1ns / 1ps
module display_time(
    input [6 : 0]main_rest_time,
    input [6 : 0]sub_rest_time,
    input clk,
    input dis, non,
    input [2 : 0]n1, n2,
    output reg [7 : 0]SIG_C,
    output reg [7 : 0]POS
);

/*
            a       
       f|_____| b
         _____g 
       e|_____| c
            d
*/
    parameter [7 : 0]zero = 8'b 0011_1111, one = 8'b 0000_0110, 
        two = 8'b 0101_1011, three = 8'b 0100_1111, four = 8'b 0110_0110, 
        five = 8'b 0110_1101,six = 8'b 0111_1101, seven = 8'b 0000_0111, 
        eight = 8'b 0111_1111, nine = 8'b 0110_1111, none = 8'b 0000_0000, 
        diss = 8'b 0100_0000;
    // 0100_1001
    integer inc = 0;

    reg [7 : 0]first, second, third, fourth;
    wire [7 : 0]result[11 : 0];
    assign result[0] = ~zero;
    assign result[1] = ~one;
    assign result[2] = ~two;
    assign result[3] = ~three;
    assign result[4] = ~four;
    assign result[5] = ~five;
    assign result[6] = ~six;
    assign result[7] = ~seven;
    assign result[8] = ~eight;
    assign result[9] = ~nine;
    assign result[10] = ~none;
    assign result[11] = ~diss;

    always @(*) begin
        if(non) begin
            first = result[10];
            second = result[10];
            third = result[10];
            fourth = result[10];
        end
        else if(dis) begin 
            first = result[11];
            second = result[11];
            third = result[11];
            fourth = result[11];
        end
        else begin 
            first = result[sub_rest_time % 10];
            second = result[sub_rest_time / 10];
            third = result[main_rest_time %10];
            fourth = result[main_rest_time / 10];
        end
    end
    
    always @(posedge clk) begin
        if(inc <= 4000) begin 
            POS <= ~ (8'b 0000_0001);
            SIG_C <= first;
            inc <= inc + 1;
        end
        else if(inc <= 8000) begin
            POS <= ~ (8'b 0000_0010);
            SIG_C <= second;
            inc <= inc + 1;
        end
        else if(inc <= 12000) begin
            POS <= ~ (8'b 0000_0100);
            SIG_C <= third;
            inc <= inc + 1;
        end
        else if(inc <= 16000) begin
            POS <= ~ (8'b 0000_1000);
            SIG_C <= fourth;
            inc <= inc + 1;
        end
        else if(inc <= 20000) begin
            POS <= ~(8'b 0001_0000);
            SIG_C <= (n1 == 5 && n2 == 5)? result[10] : 
                    ((n1 == 0 || n2 == 0)? 8'b 0111_1111: 8'b 1111_1111);
                inc <= inc + 1;
        end
        else if(inc <= 24000) begin
            POS <= ~(8'b 0010_0000);
            SIG_C <= (n1 == 5 && n2 == 5)? result[10] : 
                ((n1 == 1 || n2 == 1)? 8'b 0111_1111: 8'b 1111_1111);
            inc <= inc + 1;
        end
        else if(inc <= 28000) begin
            POS <= ~(8'b 0100_0000);
            SIG_C <= (n1 == 5 && n2 == 5)? result[10] : 
                ((n1 == 2 || n2 == 2)? 8'b 0111_1111: 8'b 1111_1111);
            inc <= inc + 1;
        end
        else if(inc <= 32000) begin
            POS <= ~(8'b 1000_0000);
            SIG_C <= (n1 == 5 && n2 == 5)? result[10] : 
                ((n1 == 3 || n2 == 3)? 8'b 0111_1111: 8'b 1111_1111);
            inc <= inc + 1;
        end
        else
            inc <= 0;
    end 
endmodule // display_time