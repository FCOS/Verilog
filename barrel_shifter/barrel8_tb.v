`timescale 1ns / 1ps

module barrel8_tb;

	// Outputs
	reg [7:0] test_in;
	reg [2:0] shift;
	reg right;
	wire [7:0] test_out;
	

	// Instantiate the Unit Under Test (UUT)
	barrel8 uut (
		.start(test_in), .shift(shift), .result(test_out), .right(right)
	);

	initial begin
		test_in = 8'b11110000; //sample 8 bit numer
		shift = 3'b010;
		right = 1;
		#100; //delay 100
		
		test_in = 8'b11110000;
		shift = 3'b010;
		right = 0;
		#100;
		
		test_in = 8'b11000000;
		shift = 3'b010;
		right = 1;
		#100;
        
		$stop;
	end
	initial begin
		$monitor($stime,, test_in[7],, test_in[6] ,,test_in[5] ,,test_in[4] ,,test_in[3] ,,test_in[2] ,,test_in[1] ,,test_in[0] ,
		, test_out[7],, test_out[6],, test_out[5],, test_out[4],, test_out[3],, test_out[2],, test_out[1],, test_out[0]);	
	end
endmodule

