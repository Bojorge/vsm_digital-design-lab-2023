module Problema_3 (
    input wire clk,
    input wire reset,
    output wire [3:0] counter_output
);

    wire [3:0] count; // Señal de salida del contador

    // Instancia del contador
    CountdownCounter #(6) my_counter (
        .clk(clk),
        .rst(reset),
        .count(count)
    );

    assign counter_output = count; // Asignar la salida del contador

endmodule
