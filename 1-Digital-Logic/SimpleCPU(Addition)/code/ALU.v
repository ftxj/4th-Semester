module ALU(aluA, aluB, alufun, valE, setCC, ZF, SF, OF);
	input [15: 0]aluA;
	input [15: 0]aluB;
	input [3 : 0]alufun;
	input setCC;
	output [15: 0]valE;
	output ZF, SF, OF;

	localparam aluAdd = 0, aluSub = 1, aluAnd = 2, aluXor = 3;

	assign valE = alufun == aluAdd? aluA + aluB :
		(alufun == aluSub? aluA - aluB : 
			(alufun == aluAdd? aluA & aluB :
				(alufun == aluXor? aluA ^ aluB : 1)));
	
	assign ZF = setCC? (valE == 0? 1 : 0) : ZF;
	assign SF = setCC? (valE[15] ==  1? 1 : 0) : SF;
	assign OF = 0;
endmodule // 