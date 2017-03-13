`timescale 1ns / 1ps

module LFSB(
    input wire clk,
    input wire reset,
	 output wire lfsr_out,
	 output wire max_tick,
	 output wire [15:0] num_ones,
	 output wire [15:0] num_zeroes
    );

	localparam seed = 16'b1011010011110011;
	reg [15:0] lfsr_reg; //curent values in register
	reg [15:0] lfsr_next; //next pos for values
	reg lfsr_tap; //tap - input to LFSR
	reg [15:0] num_1; // number of 1
	reg [15:0] num_0; //  number of 0
	
	initial //initialise counts to zero
	begin
	num_0 = 15'b0;
	num_1 = 15'b0;
	end
	
	always @(negedge max_tick) //Reset count on maxtick and reset
	begin
		num_0 = 15'b0;
		num_1 = 15'b0;
	end
	
	//clock
	always @(posedge clk, posedge reset)
		if(reset) //when reset, store seed in register
		lfsr_reg <= seed;
		else
		begin
			if(lfsr_out) //if MSB is 1, add 1 to num_ones
			num_1 = num_1 + 1;
			else			//if MSB is 0, add 0 to num_zero
			num_0 = num_0 + 1;
		lfsr_reg <= lfsr_next; //update register
		end
		
		
		
		
	always @*
		begin
		lfsr_tap = lfsr_reg[3] ~^ lfsr_reg[12] ~^ lfsr_reg[14] ~^ lfsr_reg[15]; //tap logic
		lfsr_next = {lfsr_reg[14:0], lfsr_tap}; //shift register
		end
			
	assign max_tick = {lfsr_reg == seed} ? 1'b1 : 1'b0;
	assign lfsr_out = lfsr_reg[15];
	assign num_ones = num_1;
	assign num_zeroes = num_0;
	
endmodule
