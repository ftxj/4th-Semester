module sim();
	reg clk;
	wire [3 : 0]icode, ifun, rA, rB;
	wire [15: 0]valC, valP;
	wire instr_valid, need_regids, need_valC;
	//译码
	wire [3 : 0]srcA, srcB;
	wire [15 : 0]valA, valB;
	//执行
	wire [15: 0]aluA, aluB;
	wire [3 : 0]alufun;
	wire setCC;
	wire ZF, SF, OF;
	wire [15: 0]valE;
	//访存
	wire [15: 0]mem_addr, mem_data;
	wire write, read;
	wire [15: 0]valM;
	reg [4000 : 0]CS;
	//写回
	wire [3 : 0]dstE, dstM;
	//更新PC
	wire [15 :0]PC;
  wire [ 2 :0]CPU_state;
	wire [255: 0]REGS;
	wire [4000 : 0]Memory;
	CPU XPU(clk,
	icode, ifun, rA, rB, valC, valP, instr_valid, need_regids, need_valC,
	srcA, srcB,valA, valB,
	aluA, aluB,alufun,setCC,ZF, SF, OF,valE,
	mem_addr, mem_data,write, read,valM, CS,
	dstE, dstM,
	PC, CPU_state, REGS, Memory);
	/* 
		0000	irmov 0, rax      	30 f0 00 00
		0020	irmov 0, rdx      	30 f3 00 00
		0040	irmov 1, rbx		30 f1 10 00
		0060	irmov 100, rcx		30 f2 46 00
		0080	Opadd rbx, rax		60 10 
		0090	Opadd rax, rdx		60 03
		00a0	Opsub rbx, rcx		61 12
		00b0	jne   0080  		73 08 00
		00d0 	halt				10
	*/
	initial begin
		clk = 0;
		CS = 228'b 0000_0001_0000_0000_1000_0000_0011_0111_0010_0001_0001_0110_0011_0000_0000_0110_0000_0001_0000_0110_0000_0000_0110_0100_0010_1111_0000_0011_0000_0000_0000_0001_0001_1111_0000_0011_0000_0000_0000_0000_0011_1111_0000_0011_0000_0000_0000_0000_0000_1111_0000_0011;
	end
	always begin
		#5 clk = ~clk;
	end
endmodule // 