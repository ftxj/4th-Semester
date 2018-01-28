module CPU(clk,
	icode, ifun, rA, rB, valC, valP, instr_valid, need_regids, need_valC,
	srcA, srcB,valA, valB,
	aluA, aluB,alufun,setCC,ZF, SF, OF,valE,
	mem_addr, mem_data,write, read,valM, CS,
	dstE, dstM,
	PC,
	CPU_state, REGS, Memory
);

	input clk;
	input  [4000 : 0]CS;
	output reg [255: 0]REGS;
	output reg [4000 : 0]Memory;
	output reg [2 : 0]CPU_state;
	reg [2 : 0] n_state;

	localparam fetch = 0, decode = 1, execute = 2, memory = 3, 
		write_back = 4, PCupdate = 5, stop = 6, error = 7;

	localparam halt = 0, nop = 1, rrmov = 2, irmov = 3, rmmov = 4, mrmov = 5, OPq = 6,
		jxx = 7, call = 8, ret = 9, push = 10, pop = 11;
	localparam aluAdd = 0, aluSub = 1, aluAnd = 2, aluXor = 3;
	localparam jmp = 0, jl = 1, je = 2, jnz = 3;

	localparam irax = 0, irbx = 1, ircx = 2, irdx = 3, irsp = 4, irbp = 5, 
    irsi = 6, irdi = 7, ir8 = 8, ir9 = 9, ir10 = 10, ir11 = 11, 
    ir12 = 12, ir13 = 13, ir14 = 14, irno = 15;
	
	//取指
	output [3 : 0]icode, ifun, rA, rB;
	output [15: 0]valC, valP;
	output instr_valid, need_regids, need_valC;
	//译码
	output [3 : 0]srcA, srcB;
	output [15 : 0]valA, valB;
	//执行
	output [15: 0]aluA, aluB;
	output [3 : 0]alufun;
	output setCC;
	output ZF, SF, OF;
	output [15: 0]valE;

	//访存
	output [15: 0]mem_addr, mem_data;
	output write, read;
	output [15: 0]valM;
	//写回
	output [3 : 0]dstE, dstM;
	//更新PC
	output reg [15 :0]PC;
	
	//取指
	assign instr_valid = icode > 12 ? 1 : 0;
	assign need_regids = ((icode >= 2 && icode <= 6) || (icode == 10 || icode == 11)) ? 1 : 0;
	assign need_valC = ((icode >= 3 && icode <= 8) && icode != 6) ? 1 : 0;
	assign icode = CS[PC+: 4];
	assign ifun = CS[(PC + 4)+: 4];
	assign rA = CS[(PC + 8)+: 4];
	assign rB = CS[(PC +12)+: 4];
	assign valC = need_regids? CS[(PC +16)+: 16] : CS[(PC + 8)+: 16];
	assign valP = PC + need_regids * 8 + need_valC * 16 + 8;

	//译码
	assign srcA = ((icode == rrmov) || (icode == rmmov) || (icode == OPq) || (icode == push)) ? rA :
					(icode == ret? irsp : 15);
	assign srcB = ((icode == rmmov) || (icode == mrmov) || (icode == OPq)) ? rB :
					(((icode == push) || (icode == pop) || (icode == call) || (icode == ret))? irsp : 15);
	assign valA =  REGS[(srcA * 16)+: 16];
  	assign valB =  REGS[(srcB * 16)+: 16];

	//执行
	assign aluA = ((icode == rrmov)|| (icode == OPq))? valA :
					((icode == irmov || icode == rmmov || icode == mrmov)? valC:
						((icode == call || icode == push)? -8 : 
							((icode == pop)? 8 : 1)));
	assign aluB = (icode == rmmov || icode == mrmov || icode == OPq || icode == call || icode == push ||
					icode == ret || icode == pop)? valB : ((icode == rrmov || icode == irmov) ? 0 : 1);
	assign alufun = icode == OPq? ifun : 0;
	assign setCC = icode == OPq? 1 : 0;
	assign valE = alufun == aluAdd? aluA + aluB :
		(alufun == aluSub? aluB - aluA : 
			(alufun == aluAdd? aluA & aluB :
				(alufun == aluXor? aluA ^ aluB : 1)));
	
	assign ZF = setCC? (valE == 0? 1 : 0) : ZF;
	assign SF = setCC? (valE[15] ==  1? 1 : 0) : SF;
	assign OF = 0;

	//访存
	assign mem_addr = (icode == rmmov || icode == mrmov || icode == call || icode == push)? valE : 
					((icode == pop || icode == ret) ? valA : 1);
	assign mem_data = (icode == rmmov || icode == push)? valA : 
					(icode == call? valP : 1);
	assign read = (icode == mrmov || icode == pop || icode == ret)? 1 : 0;
	assign write = (icode == rmmov || icode == push || icode == call)? 1 : 0;
	assign valM = read? Memory[mem_addr+: 16] : 15;

	//写回
	assign dstM = (icode == mrmov || icode == pop)? rA : 15;
	assign dstE = (icode == rrmov || icode == irmov || icode == OPq)? rB : 
					((icode == push || icode == pop || icode == call || icode == ret)? irsp : 15);
	

	reg x;
	initial begin
		PC <= 0;
		CPU_state <= fetch;
		REGS <= 0;
		Memory <= 0;
	end
	
	always @(posedge clk) begin
		case (CPU_state)
			fetch : begin
				CPU_state <= instr_valid? error : decode;
			end
			decode : begin
				CPU_state <= (icode == halt)? stop : execute;
			end
			execute : begin
				CPU_state <= memory; 
			end
			memory : begin
				if(write)
					Memory[mem_addr+: 16] <= mem_data;
				else
					x <= 0;
				CPU_state <= write_back;
			end
			write_back : begin
				REGS[(dstE * 16)+: 16] <= valE;
				REGS[(dstM * 16)+: 16] <= valM;
				CPU_state <= PCupdate;
			end 
			PCupdate : begin
				PC <= (icode == call || 
					(icode == jxx && (ifun == 0 || (ifun == jnz && ZF == 0) || (ifun == je && ZF == 1) || (ifun == jl && SF == 1))))?
					valC : (icode == ret? valM : valP);
				CPU_state <= fetch;
			end
			halt : begin
				CPU_state <= halt;
			end
			error : begin
				CPU_state <= fetch;
			end
		endcase
	end
endmodule // 