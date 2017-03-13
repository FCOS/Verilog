`timescale 1ns / 1ps

module set_const_tb;

	// Inputs
	reg sel;

	// Outputs
	wire [5:0] X;

	// Instantiate the Unit Under Test (UUT)
	set_const uut (
		.sel(sel), 
		.X(X)
	);

	initial begin
		// Initialize Inputs
		sel = 0;
		#100;
		sel = 1;
		#100;
        
		// Add stimulus here

	end
      
endmodule

