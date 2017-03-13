`timescale 1ns / 1ps

module Carry_adder(
	//inputs
	input [3:0] sel,
	input [5:0] A,
	input [5:0] B,
	output [5:0] X
    );

wire [5:0] int_c;
reg not_needed = 0;
reg [5:0] int_b;
wire [5:0] neg_b;

//create a negative B
assign neg_b = ~B + 1;

//Decide which B to use
always @*
	//if A-B, negate B
	if(sel == 4'b1011)
		assign int_b = neg_b;
	//else just use B
	else
		assign int_b = B;

//full adder	
//add a[0] and b[0], and put carryout into carryin of next addiction
FullAdder adder_bit0 (.a(A[0]), .b(int_b[0]), .cin(not_needed), .s(X[0]), .cout(int_c[0]));
FullAdder adder_bit1 (.a(A[1]), .b(int_b[1]), .cin(int_c[0]), .s(X[1]), .cout(int_c[1]));
FullAdder adder_bit2 (.a(A[2]), .b(int_b[2]), .cin(int_c[1]), .s(X[2]), .cout(int_c[2]));
FullAdder adder_bit3 (.a(A[3]), .b(int_b[3]), .cin(int_c[2]), .s(X[3]), .cout(int_c[3]));
FullAdder adder_bit4 (.a(A[4]), .b(int_b[4]), .cin(int_c[3]), .s(X[4]), .cout(int_c[4]));
FullAdder adder_bit5 (.a(A[5]), .b(int_b[5]), .cin(int_c[4]), .s(X[5]), .cout(int_c[5]));


endmodule