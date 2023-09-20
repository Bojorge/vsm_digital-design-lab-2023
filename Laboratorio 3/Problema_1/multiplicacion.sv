module multiplicacion #(parameter N_bits = 4)(
  input logic [N_bits-1:0] a,
  input logic [N_bits-1:0] b,
  output logic [2*N_bits-1:0] result
);

  always_comb begin
    result = a * b;
  end

endmodule

