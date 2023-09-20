module resta(
    input logic a,
    input logic b,
    output logic result,
    output logic borrow_in,
    output logic borrow
);
    logic temp_a; // Temporary variable to store the modified value of 'a'

    always @(*) begin
        if (borrow_in == 1'b1) begin
            temp_a = a - 1;
        end
        else begin
            temp_a = a;
        end
    end

    assign result = temp_a ^ b; // Diferencia: XOR entre A y B
    assign borrow = ~temp_a & b; // Prestado: AND entre el complemento de A y B
    assign borrow_in = borrow;
endmodule
