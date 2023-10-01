module Register_state(input clk, 
                input logic rst, 
                input [7:0] data_in, 
                output reg [7:0] data_out);

  // Proceso que maneja el registro
  always_ff @(posedge clk or posedge rst) begin
    if (rst)  
      data_out = 8'b0;
    else
      data_out = data_in; // Copia el dato de entrada a la salida
  end

endmodule


