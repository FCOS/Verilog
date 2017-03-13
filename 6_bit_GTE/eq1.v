// Listing 1.1
module eq1
   // I/O ports
   (
    input wire i0, i1,
    output wire eq
   );

   // signal declaration
   wire p0, p1;

	//if both i0 and i1 are 0
   assign p0 = ~i0 & ~i1;
	//if both io and i1 are 1
   assign p1 = i0 & i1;

	//if either of the above, they are equal
   assign eq = p0 | p1;
  

endmodule