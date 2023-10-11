module CountdownCounter #(
    parameter int N = 4 // Número de bits del contador
) (
    input wire clk,     // Señal de reloj
    input wire rst,     // Señal de reset asincrónico
    output wire [N-1:0] count // Salida del contador regresivo
);

    reg [N-1:0] counter; // Declaración del contador interno

    always @(posedge clk or posedge rst) begin
        if (rst) // Si rst es 1, se activa el reset
            counter <= 0; // Reseteamos el contador al valor inicial
        else if (counter > 0) // Si no estamos en cero
            counter <= counter - 1'b1; // Decrementamos el contador
    end

    assign count = counter; // Asignamos la salida

endmodule
