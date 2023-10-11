//Registro de casillas marcadas como posibles minas
module registroCasillasMarcadas (
    input wire clk,
    input wire reset,
    input logic [3:0] casilla [0:1], 
    input logic [1:0] gridIn [0:7][0:7],
    output logic [1:0] gridOut [0:7][0:7]
);

reg registro;

integer i, j;

// Reestablecer las casillas marcadas a 2'b00 (Estado neutral)

logic [1:0] gridRst [0:7][0:7] = gridIn;

initial begin
    for (i = 0; i < 8; i = i + 1) begin
        for (j = 0; j < 8; j = j + 1) begin
            if (gridRst[i][j] == 2'b10) begin
                gridRst[i][j] = 2'b00; 
            end
        end
    end
end

// Cambiar el estado de la casilla input a marcada

logic [1:0] gridMarcar [0:7][0:7] = gridIn;

initial begin
    for (i = 0; i < 8; i = i + 1) begin
        for (j = 0; j < 8; j = j + 1) begin
            if (i == casilla[0] && j == casilla[1]) begin
                gridMarcar[i][j] = 2'b10; 
            end
        end
    end
end


always @(posedge clk or posedge reset) begin
    if (reset) begin
        registro <= gridIn; // Reset -> Matriz vacia 
    end else begin
        registro <= gridMarcar; //Guarda el grid agregando la nueva casilla marcada
    end
end

assign gridOut = registro; // La salida del registro es igual al valor almacenado en el registro

endmodule

