`timescale 1ns / 1ps

module xor_6bit_tb;

	// Inputs
	reg [5:0] A;
	reg [5:0] B;

	// Outputs
	wire [5:0] X;

	// Instantiate the Unit Under Test (UUT)
	XOR_6bit uut (
		.A(A), 
		.B(B), 
		.X(X)
	);


	initial begin
		// Initialize Inputs
		A = 6'b101010;
		B = 6'b101010;
		#100;
		
		A = 6'b111111;
		B = 6'b101010;
		#100;
		
		A = 6'b000000;
		B = 6'b000000;
		#100;
		
		A = 6'b110100;
		B = 6'b010101;
		#100;
       $stop;
	end
      
endmodule

