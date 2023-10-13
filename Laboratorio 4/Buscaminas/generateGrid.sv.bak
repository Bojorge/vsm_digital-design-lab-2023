//Generar un grid 8x8 con cantMinas en posiciones aleatorias 
module generateGrid ( 
    input wire [3:0] cantMinas, 
    output logic [1:0] gridMinas [0:7][0:7] 
); 
 
integer i, j; 
integer minasGeneradas = 0; 
integer rand_row, rand_col; //columna y fila aleatoria 
 
// Inicializar todo el grid con 2'b00 (Estado neutral) 
initial begin 
    for (i = 0; i < 8; i = i + 1) begin 
        for (j = 0; j < 8; j = j + 1) begin 
            gridMinas[i][j] = 2'b00; 
        end 
    end 
end 
 
// Generar posiciones aleatorias con 2'b11 (Mina) 
initial begin 
    while (minasGeneradas < cantMinas) begin 
        rand_row = $random % 8; 
        rand_col = $random % 8; 
 
        if (gridMinas[rand_row][rand_col] == 2'b00) begin // Siempre y cuando la casilla seleccionada esté en 2'b00 (Estado neutro) 
            gridMinas[rand_row][rand_col] = 2'b11; 
            minasGeneradas = minasGeneradas + 1; 
        end 
    end 
end 
 
endmodule