module shiftRight #(parameter N_bits = 4)(
		input logic [N_bits-1:0] a,
		input logic [N_bits-1:0] b,
		output logic [N_bits-1:0] result
);
 
    assign result = a >> b;
             
endmodule