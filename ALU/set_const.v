`timescale 1ns / 1ps

module set_const(
    input sel,
    output [5:0] X
    );
	 
	 //internal result signal
	 reg [5:0] result;
	 
	 
	always @*
	//if bit is 1, set to 1's
		if(sel==1)
			result = 6'b111111;
	//else set to 0's
		else
			result = 6'b000000;
			
	//assign output to X
	assign X = result;

endmodule
