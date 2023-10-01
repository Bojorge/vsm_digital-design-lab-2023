module Mux(
  input [7:0] input1,
  input [7:0] input2,
  input logic mux_cont,
  output [7:0] output_mux
);

  assign output_mux = (mux_cont == 1'b0) ? input1 : input2;

endmodule
