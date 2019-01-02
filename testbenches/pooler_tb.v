`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2018 16:53:38
// Design Name: 
// Module Name: pooler_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pooler_tb();

reg clk,ce;
reg [7:0] 	data_in;
reg 		master_rst;
wire [7:0] data_out;
wire pause_inputs;
wire valid_op;
wire end_op;
parameter clkp = 40;
integer i;
pooler dut(clk,ce,master_rst,data_in,data_out,valid_op,end_op);

initial begin
clk 		= 0;
ce 			= 0;
data_in 	= 0;
master_rst 	= 0;
#100;
master_rst 	= 1;
//#clkp;
#20;
master_rst  = 0;
#20;
ce = 1;
//#40;//#(clkp/2);
//data_in = 0;
//#clkp;
//for(i = 0; i<144;i = i+1) begin
	/*for(i = 1; i<17;i = i+1) begin 
		data_in = i;//($urandom % 200);
		#clkp;
	end
	*/

	/*
	for(i = 1; i<17;i = i+1) begin 
		data_in = i;//($urandom % 200);
		#clkp;

	end

	ce = 0;
	#clkp;
	ce = 1;

	for(i = 16; i>0;i = i-1) begin 
		//if(pause_inputs)
		//#clkp;
		data_in = i;//($urandom % 200);
		#clkp;
	end

	ce = 0;
	#clkp;
	ce = 1;
	*/

	for(i = 1; i<37;i = i+1) begin 
		data_in = i;//($urandom % 200);
		#clkp;
	end	

	#clkp;
	master_rst  = 1;
	ce = 0;
	#20;
	master_rst  = 0;
	#20;
	ce = 1;

	for(i = 36;i>0;i = i-1) begin 
		data_in = i;//($urandom % 200);
		#clkp;

	end

	#clkp;
	ce = 0;
	
	//ce = 1;
	
//for(i = 19; i>=10;i = i-1) begin
//if(pause_inputs)
//#clkp;
//data_in = i;//($urandom % 200);
//#clkp;
//end

//for(i = 20; i<30;i = i+1) begin
//if(pause_inputs)
//#clkp;
//data_in = i;//($urandom % 200);
//#clkp;
//end

//for(i = 39; i>=30;i = i-1) begin
//if(pause_inputs)
//#clkp;
//data_in = i;//($urandom % 200);
//#clkp;
//end
//for(i = 100; i>0;i = i-1) begin
//if(pause_inputs)
//#clkp;
//data_in = ($urandom % 200);
//#clkp;
//end

end
always #(clkp/2) clk = ~clk;
endmodule
