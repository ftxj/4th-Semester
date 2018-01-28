`timescale 1ns / 1ps
module light(
    input clk,
    input [2 : 0]light_state,
    output reg [2 : 0]C_LED
);
    localparam C_NONE = 3'b000, C_RED = 3'b100,C_YELLOW = 3'b110, C_GREEN = 3'b010;
    localparam RED = 0, YELLOW = 1, GREEN = 2,
        GREEN_U = 3, RED_U = 4, STAR = 5, OFF = 6;
    localparam CLOCK_HZ = 5000_0000;

    integer inc;

    initial begin
        inc <= 0;
        C_LED <= 0;
    end

    always @(posedge clk) begin
        case (light_state)
            OFF : begin
                C_LED <= C_NONE;
            end
            RED : begin
                C_LED <= C_RED;
            end
            GREEN : begin
                C_LED <= C_GREEN;
            end
            YELLOW : begin
                C_LED <= C_YELLOW;
            end
            GREEN_U : begin
                C_LED <= C_GREEN;
            end
            RED_U : begin
                C_LED <= C_RED;
            end
            STAR : begin // 黄灯闪烁部分
                if(inc <= CLOCK_HZ) begin
                    C_LED <= C_YELLOW;
                    inc <= inc + 1;
                end
                else begin
                    if(inc == 2 * CLOCK_HZ)
                        inc <= 0;
                    else begin
                        C_LED <= C_NONE;
                        inc = inc + 1;
                    end
                end
            end
        endcase
    end
endmodule