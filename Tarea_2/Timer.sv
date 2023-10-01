module Timer(
  input clk,
  input logic rst,
  input logic rst_timer,
  output [7:0] timer_out
);

  reg [7:0] count; // Contador de temporizador de 8 bits

  // Proceso que maneja el contador de temporizador
  always @(posedge clk) begin
    if (rst || rst_timer) // Restablecer en flanco de subida de rst o rst_timer
      count <= 8'b0;
    else if (count == 8'hFF)  // Verificar el desbordamiento (8 bits)
      count <= 8'b0;
    else
      count <= count + 1'b1; // Usar <= para actualizar registros
  end

  assign timer_out = count;

endmodule