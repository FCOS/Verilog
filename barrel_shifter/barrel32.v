`timescale 1ns / 1ps
module barrel32(
input wire [31:0] start,
input wire [4:0] shift,
input wire right,
output reg [31:0] result

    );
	 
	reg [4:0] neg_shift; 
	reg [31:0] s1, s2, s4, s8;
	
always @*

	if(right==1)//if shifting right
		begin
		assign s1 = shift[0] ? {start[0], start[31:1]} : start; //if shift[0] is high, shift start value right once, else take start value
		assign s2 = shift[1] ? {s1[1:0], s1[31:2]} : s1; //if shift [1] is high, shift previous right once, else take previous value
		assign s4 = shift[2] ? {s2[3:0], s2[31:4]} : s2;
		assign s8 = shift[3] ? {s4[7:0], s4[31:8]} : s4;
		assign result = shift[4] ? {s8[15:0], s8[31:16]} : s8;
		end
	else if(right==0)
		begin
		neg_shift = ~shift + 1;//if rotating left, invert shift, and add one, then just rotate right
		assign s1 = neg_shift[0] ? {start[0], start[31:1]} : start;
		assign s2 = neg_shift[1] ? {s1[1:0], s1[31:2]} : s1;
		assign s4 = neg_shift[2] ? {s2[3:0], s2[31:4]} : s2;
		assign s8 = neg_shift[3] ? {s4[7:0], s4[31:8]} : s4;
		assign result = neg_shift[4] ? {s8[15:0], s8[31:16]} : s8;
		end


endmodule
