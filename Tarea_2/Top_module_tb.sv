module Top_module_tb;

  // Parámetros de simulación
  reg clk;
  reg rst;
  reg M;
  reg rst_manual;
  wire [1:0] system_state;
  wire [7:0] reg_data;

  // Instancia del módulo Top_module
  Top_module uut (
    .clk(clk),
    .rst(rst),
    .M(M),
    .rst_manual(rst_manual),
    .system_state(system_state),
    .reg_data(reg_data)
  );

  // Generador de clock
  always begin
    #10 clk = ~clk;
  end

  // Inicialización de señales
  initial begin
	 M = 0;
    clk = 0;
	 rst = 0;
	 rst_manual = 0;
	 
    
    #150 
	 M = 1;

	 #210 
   
    
 

    

    // Finalizar simulación
    $finish;
  end

  // Monitoreo de estado y registro
  always @(posedge clk) begin
    $display("Tiempo: %t, Estado del sistema: %h, Registro de estado: %b", $time, system_state, reg_data);
  end

endmodule
