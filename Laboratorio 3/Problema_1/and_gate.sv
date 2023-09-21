module and_gate #(parameter N_bits = 4)(
		input logic [N_bits-1:0] a,
		input logic [N_bits-1:0] b,
		output logic result
);
 
        assign result = a & b;
             
endmodule