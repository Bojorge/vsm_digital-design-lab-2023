module White_Screen (
    output [3:0] red,     // RED (to resistor DAC VGA connector)
    output [3:0] green,   // GREEN (to resistor DAC to VGA connector)
    output [3:0] blue,    // BLUE (to resistor DAC to VGA connector)
    input clk,            // CLK from VGA controller
    input hsync,          // HSYNC from VGA controller
    input vsync           // VSYNC from VGA controller
);

    // Color output logic (genera una pantalla blanca)
    reg [7:0] red_reg;
    reg [7:0] green_reg;
    reg [7:0] blue_reg;

    always @(posedge clk) begin
        if (hsync && vsync) begin
            // Establecer todos los canales de color a 0 para obtener blanco
            red_reg <= 8'd0;    // Rojo
            green_reg <= 8'd0;  // Verde
            blue_reg <= 8'd0;   // Azul
        end else begin
            red_reg <= 8'd0;
            green_reg <= 8'd0;
            blue_reg <= 8'd0;
        end
    end

    // Assign output values - to VGA connector
    assign red = red_reg;
    assign green = green_reg;
    assign blue = blue_reg;

endmodule

