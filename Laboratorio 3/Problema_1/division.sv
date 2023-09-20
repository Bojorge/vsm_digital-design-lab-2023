module division #(parameter N_bits = 4)(
    input logic [N_bits-1:0] a,
    input logic [N_bits-1:0] b,
    output logic [N_bits-1:0] result
);

    always_comb begin
        if (b == 0) begin
            result = {N_bits{1'b0}};
        end else begin
            result = a / b;
        end
    end

endmodule

