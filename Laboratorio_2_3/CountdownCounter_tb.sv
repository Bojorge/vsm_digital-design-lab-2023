module Testbench;

    reg clk;
    reg rst;
    wire [1:0] count_2;
    wire [3:0] count_4;
    wire [5:0] count_6;
    
    CountdownCounter #(2) counter_2 (
        .clk(clk),
        .rst(rst),
        .count(count_2)
    );
    
    CountdownCounter #(4) counter_4 (
        .clk(clk),
        .rst(rst),
        .count(count_4)
    );
    
    CountdownCounter #(6) counter_6 (
        .clk(clk),
        .rst(rst),
        .count(count_6)
    );
    
    initial begin
        clk = 0;
        rst = 1;
        #5 rst = 0; // Activar el reset
        
        // Simulación para 10 ciclos de reloj
        repeat (10) begin
            #5 clk = ~clk;
        end
        
        // Imprimir resultados
        $display("2-bit counter: %b", count_2);
        $display("4-bit counter: %b", count_4);
        $display("6-bit counter: %b", count_6);
        
        $finish; // Finalizar simulación
    end
    
endmodule
