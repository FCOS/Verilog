`timescale 1ns / 1ps

module reg_opperator(
    input [3:0] sel,
    input [5:0] A,
    input [5:0] B,
    output [5:0] X
    );

	reg [5:0] result;
	
	always @*
		case(sel)
			4'b0001 : result = A;//A
			4'b0010 : result = B;//B
			4'b0100 : result = ~A + 1;//-A
			4'b0101 : result = ~B + 1;//-B
			4'b1001 : result = ~A;//A not
			4'b1010 : result = ~B;//B not
		endcase
		
	assign X = result;

endmodule
