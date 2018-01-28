module memory(clk, mem_addr, mem_data, valM, read, write);
	input clk;
	input [15 : 0]mem_addr;
	input [15 : 0]mem_data;
	input read;
	input write;
	output [15 : 0]valM;

	reg [4000 : 0]Memory;
	reg x;

	assign valM = read? Memory[mem_addr+: 16] : 15;
	always @(posedge clk) begin
		if(write)
			Memory[mem_addr+: 16] <= mem_data;
		else
			x <= 0;
	end
endmodule // memory