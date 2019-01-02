`timescale 1ns / 1ps

module  shifter_row(
		//input				clk,
		//input 	[7:0]		delay,
		input	[7:0]		in,
		input				CE,
		input				rst,

		output wire	[7:0]	shift_out
	);

	parameter delay = 3;
	integer 	i   = delay-1;
	reg [7: 0] shifter [36: 0] ;

	always @(rst or CE) begin
		if(rst)	begin
			while(i >= 0)begin
				shifter[i] = 8'h0;
				i = i-1;
			end
			if(i == -1) i = delay-1;
		end

		else if(CE)begin
			while(i > 0)begin
				shifter[i] = shifter[i-1];
				i = i-1;
			end
			if(i == 0) i = delay-1;
			shifter[0] 	= in;
		end
		
		else begin
			
		end
	end

	assign shift_out = shifter[delay-1];

endmodule