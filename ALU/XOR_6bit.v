`timescale 1ns / 1ps

module XOR_6bit(
    input [5:0] A,
	 input [5:0] B,
    output [5:0] X
    );
	
	//XOR
	assign X = A ^ B;

endmodule
