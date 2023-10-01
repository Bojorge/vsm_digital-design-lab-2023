module Comparator(
						input [7:0] timer_out, // Salida del temporizador de 8 bits
                  output logic t0); // Salida del comparador

  // Comparador para verificar si el temporizador es mayor o igual a 200
  always @(timer_out) begin
    if (timer_out > 8'hC8) // 200 en hexadecimal es 8'hC8 en 8 bits
      t0 = 1'b1;    // Si es mayor o igual a 200, se establece en 1 -> va al estado 3
    else
      t0 = 1'b0;    // Si es menor a 200, se establece en 0 -> va al estado 0
  end

endmodule



