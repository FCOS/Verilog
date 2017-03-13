`timescale 1ns / 1ps

module shifter_3bit_right(
    input [3:0] sel,
    input [5:0] A,
    input [5:0] B,
    output [5:0] X
    );

	reg [5:0] result;
	
	always @*
		case(sel)
			//shift A
			4'b0110 : result = {A[2:0], A[5:3]};
			//shift B
			4'b0111 : result = {B[2:0], B[5:3]};
		endcase
		
	assign X = result;

endmodule
