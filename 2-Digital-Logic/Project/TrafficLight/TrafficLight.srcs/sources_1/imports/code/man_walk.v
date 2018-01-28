module man_walk(
    input clk,
    input [6 : 0]rest_time,
    input [6 : 0]state,
    input man,
    output reg [2 : 0]n
);
    localparam FIVE_GREEN = 32;
    always @(posedge clk) begin
        if(man && state == FIVE_GREEN) begin
            case(rest_time % 5)
                0 : begin n <= 0; end
                4 : begin n <= 1; end
                3 : begin n <= 2; end
                2 : begin n <= 3; end
                1 : begin n <= 3; end 
            endcase
        end
        else n <= 5;
    end
endmodule