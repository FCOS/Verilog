`timescale 1ns / 1ps

module shifter_tb;

	// Inputs
	reg [3:0] instruction;
	reg [5:0] A;
	reg [5:0] B;

	// Outputs
	wire [5:0] X;

	// Instantiate the Unit Under Test (UUT)
	shifter_3bit_right uut (
		.instruction(instruction), 
		.A(A), 
		.B(B), 
		.X(X)
	);

	initial begin
		instruction = 4'b0110;
		A = 6'b111000;
		B = 6'b101010;
		#100;
		
		A = 6'b001100;
		B = 6'b101010;
		#100;
		
		instruction = 4'b0111;
		A = 6'b101010;
		B = 6'b111000;
		#100;
		
		A = 6'b111111;
		B = 6'b010010;
		#100;
	end
      
endmodule

