// Listing 1.4
module gt_eq6
   (
    input  wire[5:0] a, b,
    output wire aeqb
   );

   // internal signal declaration
   wire e0, e1, e2, e3, e4, e5, e6, e7, e8;

   // body
   
	/* A six bit greater than or equal module using two bit greater than or equals modules */
	
	gt2 gt2_bit0_unit (.a(a[5:4]), .b(b[5:4]), .aeqb(e0));
	gt2 gt2_bit1_unit (.a(a[3:2]), .b(b[3:2]), .aeqb(e1));
	gt2 gt2_bit2_unit (.a(a[1:0]), .b(b[1:0]), .aeqb(e2));
	
	eq2 eq2_bit0_unit (.a(a[5:4]), .b(b[5:4]), .aeqb(e3)); 
	eq2 eq2_bit1_unit (.a(a[3:2]), .b(b[3:2]), .aeqb(e4)); 
	eq2 eq2_bit2_unit (.a(a[1:0]), .b(b[1:0]), .aeqb(e5)); 
	
	assign e6 = e3 & e4 & e5;
	assign e7 = e2 & e3 & e4;
	assign e8 = e1 & e3;	
	
	
   assign aeqb = e0 | e6 | e7 | e8;   

endmodule