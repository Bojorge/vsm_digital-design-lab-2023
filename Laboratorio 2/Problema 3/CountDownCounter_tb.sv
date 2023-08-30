module CountDownCounter_tb;
    reg clk;
    reg reset;
    wire [3:0] count;

	 
    // Instancia del módulo CounterRegresivo
    CountDownCounter #(4) dut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Generación de señal de reloj
    always #5 clk = ~clk;

    // Inicialización
    initial begin
        clk = 0;
        reset = 0;
        #10 reset = 1; // Activa el reset durante 10 unidades de tiempo
        #20 reset = 0; // Desactiva el reset
        
        // Esperar un tiempo antes de comenzar a mostrar los valores
        #2;

        // Mostrar cada valor de la cuenta regresiva desde el valor máximo hasta 0
        for (int i = 15; i >= 0; i = i - 1) begin
		  
				
				
            // Esperar hasta que el valor de la cuenta cambie
            @(posedge clk);
            
				// Mostrar el valor actual de la cuenta regresiva
            $display("Valor de la cuenta regresiva: %d", count);
            
        end

    end
endmodule
