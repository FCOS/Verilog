`timescale 1ns / 1ps


module Adder_tb;

	// Inputs
	reg [3:0] instruction;
	reg [5:0] A;
	reg [5:0] B;

	// Outputs
	wire [5:0] X;

	// Instantiate the Unit Under Test (UUT)
	Carry_adder uut (
		.instruction(instruction), 
		.A(A), 
		.B(B), 
		.X(X)
	);

	initial begin
	//A-B
	instruction = 4'b1011;
		A = 6'b000100;
		B = 6'b000001;
		#100;
		
		A = 6'b111001;
		B = 6'b000111;
		#100;
		
		$stop;
	end
      
endmodule

