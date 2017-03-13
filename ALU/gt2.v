// Listing 1.4
module gt2
   (
    input  wire[1:0] a, b,
    output wire aeqb
   );

   // internal signal declaration
   wire e0, e1, e2, e3, e4, e5, e6, e7, e8;

   // body
   // instantiate two 1-bit comparators
   //eq1 eq_bit0_unit (.i0(a[0]), .i1(b[0]), .eq(e0));
   //eq1 eq_bit1_unit (.eq(e1), .i0(a[1]), .i1(b[1]));
	
	assign e0 = a[0] & ~b[1] & ~b[0];
	assign e1 = a[1] & ~b[1];
	assign e2 = a[1] & a[0] & ~b[0];
	assign e3 = e0 | e1 | e2;
	
		
   // a and b are equal if individual bits are equal
   assign aeqb = e3;
   
   

endmodule