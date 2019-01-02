`timescale 1ns / 1ps

module max_tb();
    reg clk;
    reg [31:0] data_in;
    reg rst_m;
    reg global_rst;
    reg master_rst;
    wire  [31:0] reg_op;
    
    max_reg max_reg2(
    	clk,
	    data_in,
	    rst_m,
	    global_rst,
	    master_rst,
	    reg_op);

  wire pause_inputs;
  parameter clkp = 40;
  integer i;

initial begin
  clk = 0;
  //ce = 0;
  data_in = 0;
  master_rst = 0;
  #100;
  master_rst = 1;
  #clkp;
  master_rst  = 0;
  #40;
  //ce = 1;
  //#40;//#(clkp/2);
  //data_in = 0;
  //#clkp;
  //for(i = 0; i<144;i = i+1) begin
  for(i = 1; i<17;i = i+1) begin 
  //for(i = 16; i>0;i = i-1) begin 
    if(pause_inputs)
    #clkp;
    data_in = i;//($urandom % 200);
    #clkp;
    if(i % 3== 0) master_rst = 1;
    else begin
      master_rst  = 0;
    end
  end
end
always #(clkp/2) clk = ~clk;
endmodule
