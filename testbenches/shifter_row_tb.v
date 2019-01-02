`timescale 1ns / 1ps

module shifter_row_tb();
	reg 		clk;
	//reg [7:0]	delay;
	reg [7:0]	in;
	reg			CE;
	reg			rst;

	wire [7:0]	out;

	//shifter_row shifter_row_1(clk,delay,in,CE,rst,out);
	shifter_row shifter_row_1(clk,in,CE,rst,out);

	wire pause_inputs;
  	parameter clkp = 40;
  	integer i;

	initial begin
		  clk = 0;
		  CE = 0;
		  in = 0;
		  rst = 0;
		  #100;
		  rst = 1;
		  #clkp;
		  rst  = 0;
		  #40;
		  //ce = 1;
		  //#40;//#(clkp/2);
		  //data_in = 0;
		  //#clkp;
		  //for(i = 0; i<144;i = i+1) begin
		  for(i = 1; i<17;i = i+1) begin 
			  //for(i = 16; i>0;i = i-1) begin 
			    //if(pause_inputs)
			    in = i;//($urandom % 200);
			    //#clkp;
			    if(i == 2) 	CE = 1;
			    else if(i == 4 ) 	CE = 1;
			    else if(i == 6) 	CE = 1;
			    else if(i == 8) 	CE = 1;
			    else if(i == 10) 	CE = 1;
			    else if(i == 12) 	CE = 1;
			    else if(i == 14) 	CE = 1;
			    else if(i == 16) 	CE = 1;
			    else 				CE = 0;			    
			    if(i == 9) rst = 1;
			    else begin
			    	rst = 0;
			    end
			    #clkp;

		  	end
		end
always #(clkp/2) clk = ~clk;

endmodule