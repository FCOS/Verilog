`timescale 1ns / 1ps

module reg_opperator_tb;

	// Inputs
	reg [3:0] instruction;
	reg [5:0] A;
	reg [5:0] B;

	// Outputs
	wire [5:0] X;

	// Instantiate the Unit Under Test (UUT)
	reg_opperator uut (
		.instruction(instruction), 
		.A(A), 
		.B(B), 
		.X(X)
	);

	initial begin
		// Initialize Inputs
		
		instruction = 4'b0001;
		A = 6'b001101;
		B = 6'b010110;
		#100;
		A = 6'b111111;
		B = 6'b000000;
		#100;
		
		instruction = 4'b0010;
		A = 6'b001101;
		B = 6'b010110;
		#100;
		A = 6'b111111;
		B = 6'b000000;
		#100;
		
	end
      
endmodule

