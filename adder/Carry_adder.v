`timescale 1ns / 1ps

module Carry_adder(
	//inputs
	input wire [5:0] x,
	input wire [5:0] y,
	input wire c_in,
	//outputs
	output wire overflow,
	output wire c_out,
	output wire [5:0] sum
    );

wire [5:0] int_c;

//pass bit0 of x and y into adder, with carry in, and store bit0 of sum, while outputting the carry into the next carry in
FullAdder adder_bit0 (.a(x[0]), .b(y[0]), .cin(c_in), .s(sum[0]), .cout(int_c[0]));
//                                      //carry in is prev carry out
FullAdder adder_bit1 (.a(x[1]), .b(y[1]), .cin(int_c[0]), .s(sum[1]), .cout(int_c[1]));
FullAdder adder_bit2 (.a(x[2]), .b(y[2]), .cin(int_c[1]), .s(sum[2]), .cout(int_c[2]));
FullAdder adder_bit3 (.a(x[3]), .b(y[3]), .cin(int_c[2]), .s(sum[3]), .cout(int_c[3]));
FullAdder adder_bit4 (.a(x[4]), .b(y[4]), .cin(int_c[3]), .s(sum[4]), .cout(int_c[4]));
FullAdder adder_bit5 (.a(x[5]), .b(y[5]), .cin(int_c[4]), .s(sum[5]), .cout(int_c[5]));

//overflow is last and secons last carryout, XORed
assign overflow = int_c[4]^int_c[5];
assign c_out = int_c[5];


/*
*/

endmodule
