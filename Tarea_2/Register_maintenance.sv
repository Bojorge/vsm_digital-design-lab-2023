module Register_maintenance(
  input clk,
  input logic rst,
  input logic enable,
  output reg [7:0] data_out
);

  // Proceso que maneja el registro
  always_ff @(posedge clk or posedge rst) begin
    if (rst)     
      data_out = 8'b0;
    else if (enable)
      data_out = data_out + 8'b1; 
  end

endmodule
