`timescale 1ns / 1ps

module addertb;

	// Inputs
	reg signed [5:0] x;
	reg signed [5:0] y;
	reg c_in;

	// Outputs
	wire overflow;
	wire c_out;
	wire signed [5:0] sum;

	// Instantiate the Unit Under Test (UUT)
	Carry_adder uut (
		.x(x), 
		.y(y), 
		.c_in(c_in), 
		.overflow(overflow), 
		.c_out(c_out), 
		.sum(sum)
	);

	initial begin
		//both pos
		x = 1;
		y = 2;
		c_in = 0;
		#100;
		x = 1;
		y = 2;
		c_in = 1;
		#100;
		x = 31;
		y = 31;
		c_in = 0;
		#100;
		x = 31;
		y = 31;
		c_in = 1;
		#100;
		
		//both neg
		x = -4;
		y = -5;
		c_in = 0;
		#100;
		x = -4;
		y = -5;
		c_in = 1;
		#100;
		x = -32;
		y = -32;
		c_in = 0;
		#100;
		x = -32;
		y = -32;
		c_in = 1;
		#100;
		
		//opposite 
		x = -32;
		y = 31;
		c_in = 0;
		#100;
		x = -32;
		y = 31;
		c_in = 0;
		#100;
		x = -8;
		y = 15;
		c_in = 1;
		#100;
		x = 0;
		y = 0;
		c_in = 1;
		#100;
		x = 0;
		y = 0;
		c_in = 0;
		#100;

	end
	initial
	begin
      $monitor("X=%2d,\t Y=%2d,\t carry in =%d,\t sum=%2d,\t carry out = %d,\t overflow = %d"
		, x, y, c_in, sum, c_out, overflow);
	end		
endmodule

