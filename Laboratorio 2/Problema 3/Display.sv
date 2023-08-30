module Display (
    input logic [2:0] binary_value,
    output logic [6:0] segment
);
    always_comb begin
        case (binary_value)
            3'b000: segment = 7'b0000001;
            3'b001: segment = 7'b1001111;
            3'b010: segment = 7'b0010010;
            3'b011: segment = 7'b0000110;
            3'b100: segment = 7'b1001100;
            3'b101: segment = 7'b0100100;
            default : segment = 7'b0100100;
        endcase
    end
endmodule

