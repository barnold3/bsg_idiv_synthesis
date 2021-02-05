
module bsg_chip
 import bsg_chip_pkg::*;
  (input                                               clk_i
   , input                                             reset_i

   , input [31:0]                                      a_i
   , input [31:0]                                      b_i
   , input [63:0]                                      c_i

   , output logic [63:0]                               s_o
   );

   logic [63:0] mul_lo;
   bsg_mul_synth
    #(.width_p(32))
    mul
     (.a_i(a_i)
      ,.b_i(b_i)
      ,.o(mul_lo)
      );

   logic [63:0] mul_r;
   bsg_dff
    #(.width_p(64))
    result_reg
     (.clk_i(clk_i)
      ,.data_i(mul_lo)
      ,.data_o(mul_r)
      );

   logic [63:0] c_r;
   bsg_dff
    #(.width_p(64))
    c_reg
     (.clk_i(clk_i)
      ,.data_i(c_i)
      ,.data_o(c_r)
      );

   bsg_adder_ripple_carry
    #(.width_p(64))
    adder
     (.a_i(mul_r)
      ,.b_i(c_r)
      ,.s_o(s_o)
      ,.c_o()
      );

endmodule

