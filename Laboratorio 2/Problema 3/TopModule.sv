module TopModule (
    input logic clk,
    input logic reset,
    output logic [6:0] display_segment
);
    logic [2:0] countdown_value;

    // Instancia del contador regresivo
    CountDownCounter #(3) countdown_inst (
        .clk(clk),
        .reset(reset),
        .count(countdown_value)
    );

    // Instancia del display de 7 segmentos
    Display display_inst (
        .binary_value(countdown_value),
        .segment(display_segment)
    );

endmodule