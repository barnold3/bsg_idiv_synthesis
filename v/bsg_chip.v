
module bsg_chip
  import bsg_chip_pkg::*;
     (input                  clk_i
     ,input                  reset_i

     ,input                  v_i      //there is a request
     ,output                 ready_and_o  //idiv is idle

     ,input [63:0]           dividend_i
     ,input [63:0]           divisor_i
     ,input                  signed_div_i

     ,output                 v_o      //result is valid
     ,output [63:0]          quotient_o
     ,output [63:0]          remainder_o
     ,input                  yumi_i
     );
   

    bsg_idiv_iterative #(.width_p(64)) div (
           .dividend_i,
	   .divisor_i,
	   .v_i,
	   .signed_div_i,
	   .quotient_o,
	   .remainder_o,
           .ready_and_o,
	   .v_o,
           .yumi_i,
	   .reset_i,
	   .clk_i);
endmodule // divide
