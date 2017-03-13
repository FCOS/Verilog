`timescale 1ns / 1ps

module ALU_tb;

	// Inputs
	reg [3:0] sel;
	reg [5:0] A;
	reg [5:0] B;

	// Outputs
	wire [5:0] X;

	ALU uut (
		.sel(sel), 
		.A(A),
		.B(B),
		.X(X)
	);

	initial begin
		//Assign A and B
		A = 6'b011010;
		B = 6'b011100;
		//test 1 - all zeroes
		sel = 4'b0000;
		#100;
		//test 2 - output A
		sel = 4'b0001;
		#100;
		//test 3 - output B
		sel = 4'b0010;
		#100;
		//test 4 - A greater equal B
		sel = 4'b0011;
		#100;
		//test 5 - Output -A
		sel = 4'b0100;
		#100;
		//test 6 - output -B
		sel = 4'b0101;
		#100;
		//test 7 - output A 3 bit right
		sel = 4'b0110;
		#100;
		//test 8 - output B 3 bit right
		sel = 4'b0111;
		#100;
		//test 9 - XOR
		sel = 4'b1000;
		#100;
		//test 10 - output not A
		sel = 4'b1001;
		#100;
		//test 11 - Output not B
		sel = 4'b1010;
		#100;
		//test 12 - output A-B
		sel = 4'b1011;
		#100;
		//test 13 - output A+B
		sel = 4'b1100;
		#100;
		//test 14 - all ones
		sel = 4'b1111;
		#100;
		
	end
	
endmodule

