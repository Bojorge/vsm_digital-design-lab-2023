module FSM_2_tb;

  // Parámetros de simulación
  reg clk;
  reg rst;
  reg x;
  wire [1:0] current_state;
  wire [7:0] reg_state;

  // Instancia del módulo FSM
  FSM_2 uut (
    .clk(clk),
    .rst(rst),
    .x(x),
    .current_state(current_state),
    .reg_state(reg_state)
  );

  // Generador de clock
  always begin
    #10 clk = ~clk;
  end

  // Inicialización de señales
  initial begin
    clk = 0;
    rst = 1;
	 
	 #10 rst = 0;

    // Prueba 1: Mantenimiento a tiempo
    #180 x = 1;

    // Prueba 2: Mantenimiento atrasado (generará un error)
    #210 x = 1;
	 //#10 x = 0;

    // Prueba 3: Reset manual
    #10 rst = 1;
    #10 rst = 0;
    #170 x = 1;
    

    // Prueba 4: Mantenimiento a tiempo después del reset manual
    #190 x = 1;
    #10 x = 0;

    // Finalizar simulación
    $finish;
  end

  // Monitoreo de estado y registro
  always @(posedge clk) begin
    $display("Tiempo: %t, Estado Actual: %d, Registro de Estado: %d", $time, current_state, reg_state);
  end

endmodule
