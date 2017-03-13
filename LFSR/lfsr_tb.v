`timescale 1ns / 1ps


module lfsr_tb;

	// Inputs
	reg clk;
	reg reset;
	//Outputs
	wire lfsr_out;
	wire max_tick;
	wire [15:0] num_ones;
	wire [15:0] num_zeroes;

	// Instantiate the Unit Under Test (UUT)
	LFSB uut (
		.clk(clk), 
		.reset(reset),
		.lfsr_out(lfsr_out),
		.max_tick(max_tick),
		.num_ones(num_ones),
		.num_zeroes(num_zeroes)
	);

	always	
	begin
		clk = 0;
		#(10);
		clk = 1;
		#(10);
	end

	initial begin
		reset = 1;
		#400;
		reset = 0;
		#100;

	end
      
endmodule

