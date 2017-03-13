`timescale 1ns / 1ps

module GTE_6bit(
    input [5:0] A,
    input [5:0] B,
    output [5:0] X
    );
	
	//internal wires for results of comparisons
   wire e0, e1, e2, e3, e4, e5, e6, e7, e8;

	//check if 2-bit segment from A is greater that from B 
	gt2 gt2_bit0_unit (.a(A[5:4]), .b(B[5:4]), .aeqb(e0));
	gt2 gt2_bit1_unit (.a(A[3:2]), .b(B[3:2]), .aeqb(e1));
	gt2 gt2_bit2_unit (.a(A[1:0]), .b(B[1:0]), .aeqb(e2));
	
	//check if 2-bit segment from A is equal to B
	eq2 eq2_bit0_unit (.a(A[5:4]), .b(B[5:4]), .aeqb(e3)); 
	eq2 eq2_bit1_unit (.a(A[3:2]), .b(B[3:2]), .aeqb(e4)); 
	eq2 eq2_bit2_unit (.a(A[1:0]), .b(B[1:0]), .aeqb(e5)); 
	
	//if all 3 are equal
	assign e6 = e3 & e4 & e5;
	//if least significant bits are greater, and rest are equal
	assign e7 = e2 & e3 & e4;
	//if MSBs are equal, but middle bits are greater
	assign e8 = e1 & e3;	
	
	//set to 1 if any of the above are true, or if the MSBs are greater
   assign X[0] = e0 | e6 | e7 | e8;
	//assign bits 5-1 0.
	assign X[5:1] = 0;

endmodule
