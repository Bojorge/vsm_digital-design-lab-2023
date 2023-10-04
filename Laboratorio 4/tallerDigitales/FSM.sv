module VGA_Signal_Generator (
    input wire clk_25MHz,
    input wire rst,
    output wire hsync,
    output wire vsync,
    output wire [2:0] red,
    output wire [2:0] green,
    output wire [2:0] blue
);

reg [9:0] h_counter = 0;  // Contador horizontal de 10 bits
reg [9:0] v_counter = 0;  // Contador vertical de 10 bits

// Define constantes para el temporizado VGA
localparam H_SYNC_CYCLES  = 96;
localparam H_BACK_PORCH   = 48;
localparam H_ACTIVE_VIDEO = 640;
localparam H_FRONT_PORCH  = 16;
localparam H_TOTAL        = 800;
localparam V_SYNC_CYCLES  = 2;
localparam V_BACK_PORCH   = 33;
localparam V_ACTIVE_VIDEO = 480;
localparam V_FRONT_PORCH  = 10;
localparam V_TOTAL        = 525;

always @(posedge clk_25MHz or posedge rst) begin
    if (rst) begin
        h_counter <= 0;
        v_counter <= 0;
    end else if (h_counter == H_TOTAL - 1) begin
        h_counter <= 0;
        if (v_counter == V_TOTAL - 1) begin
            v_counter <= 0;
        end else begin
            v_counter <= v_counter + 1;
        end
    end else begin
        h_counter <= h_counter + 1;
    end
end

// Sincronización horizontal y vertical
assign hsync = (h_counter < H_SYNC_CYCLES) ? 1'b1 : 1'b0;
assign vsync = (v_counter < V_SYNC_CYCLES) ? 1'b1 : 1'b0;

// Señales de color para una cuadrícula de 8x8
always @(h_counter, v_counter) begin
    if ((h_counter < H_SYNC_CYCLES + H_BACK_PORCH || h_counter >= H_SYNC_CYCLES + H_BACK_PORCH + H_ACTIVE_VIDEO) ||
        (v_counter < V_SYNC_CYCLES + V_BACK_PORCH || v_counter >= V_SYNC_CYCLES + V_BACK_PORCH + V_ACTIVE_VIDEO)) begin
        red   <= 3'b000;
        green <= 3'b000;
        blue  <= 3'b000;
    end else begin
        // Determina si el píxel debe ser parte de la cuadrícula de 8x8
        if ((h_counter % 80 < 8) || (v_counter % 60 < 8)) begin
            // Colorea los píxeles de la cuadrícula (por ejemplo, en blanco)
            red   <= 3'b111;
            green <= 3'b111;
            blue  <= 3'b111;
        end else begin
            // Colorea los píxeles fuera de la cuadrícula (por ejemplo, en negro)
            red   <= 3'b000;
            green <= 3'b000;
            blue  <= 3'b000;
        end
    end
end

endmodule