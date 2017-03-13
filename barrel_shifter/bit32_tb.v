`timescale 1ns / 1ps

module bit32_tb;

	// Inputs
	reg [31:0] start;
	reg [4:0] shift;
	reg right;

	// Outputs
	wire [31:0] result;

	// Instantiate the Unit Under Test (UUT)
	barrel32 uut (
		.start(start), 
		.shift(shift), 
		.right(right), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		start = 1;
		shift = 5'b00001;
		right = 0;

		// Wait 100 ns for global reset to finish
		#1000;
      start = 1;
		shift = 5'b11011;
		right = 1;

		// Wait 100 ns for global reset to finish
		#1000;
      start = 1;
		shift = 5'b00011;
		right = 1;
				
		#1000;
      start = 1;
		shift = 5'b00011;
		right = 0;
		// Add stimulus here

	end
      
endmodule

