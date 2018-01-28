module regs(clk, srcA, srcB, dstM, dstE, valA, valB, valM, valE, REGS);
  input clk;
  input [4 : 0]srcA;
  input [4 : 0]srcB;
  input [4 : 0]dstM;
  input [4 : 0]dstE;
  input [15: 0]valM;
  input [15: 0]valE;
  output [15 : 0]valA;
  output [15 : 0]valB;

  localparam irax = 0, irbx = 1, ircx = 2, irdx = 3, irsp = 4, irbp = 5, 
    irsi = 6, irdi = 7, ir8 = 8, ir9 = 9, ir10 = 10, ir11 = 11, 
    ir12 = 12, ir13 = 13, ir14 = 14, irno = 15;
  output reg [255: 0]REGS;
    
  assign valA =  REGS[(srcA * 16)+: 16];
  assign valB =  REGS[(srcB * 16)+: 16];
  always @(posedge clk) begin
		REGS[(dstE * 16)+: 16] <= valE;
		REGS[(dstM * 16)+: 16] <= valM;
  end 
endmodule // regs   