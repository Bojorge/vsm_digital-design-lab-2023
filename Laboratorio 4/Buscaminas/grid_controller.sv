module grid_controller #(
    parameter WIDTH = 640,
    parameter HEIGHT = 480,
    parameter ROWS = 8,
    parameter COLS = 8
)
(
	 input logic [2:0] grid [0:7][0:7],
	 input logic clk_25MHz,
    output logic h_synq,
    output logic v_synq,
    output logic [7:0] red,
    output logic [7:0] green,
    output logic [7:0] blue,
    output logic sync_n,
    output logic blank_n
);

    // Dimensiones de las celdas
    localparam CELL_WIDTH = WIDTH / COLS;
    localparam CELL_HEIGHT = HEIGHT / ROWS;
    localparam BOMB_R = 8'b00000000;
    localparam BOMB_G = 8'b00000000;
    localparam BOMB_B = 8'b00000000;

    // VGA variables de control
    logic enable_v_counter;
    logic [15:0] h_count_value;
    logic [15:0] v_count_value;

    
    // Contadores
    horizontal_counter vga_horizontal (clk_25MHz, enable_v_counter, h_count_value);
    vertical_counter vga_vertical (clk_25MHz, enable_v_counter, v_count_value);

    // Sincronización vertical y horizontal 
    assign h_synq = (h_count_value < 96) ? 1'b1 : 1'b0;
    assign v_synq = (v_count_value < 2) ? 1'b1 : 1'b0;

    

    // Zona activa de la pantalla (pantalla en blanco)
    assign blank_n = (h_count_value >= 96) && (h_count_value < 799) && (v_count_value >= 2) && (v_count_value < 524);
    
    always begin
        draw_game_screen();
    end

//0 --000 todas las casillas blancas
//1 --001 grid (gris y blanco)
//2 --010 casilla marcada (azul)
//3 --011 casilla seleccionada (rojo)
//4 --100 bomba (negro)


    task draw_game_screen;
        for (int i = 0; i < ROWS; i = i + 1) begin
            for (int j = 0; j < COLS; j = j + 1) begin
                if (v_count_value >= (i * CELL_HEIGHT + 35) && v_count_value < ((i+1) * CELL_HEIGHT + 35) &&
                    h_count_value >= (j * CELL_WIDTH + 144) && h_count_value < ((j+1) * CELL_WIDTH + 144)) begin

                    case(grid[i][j])
								0: begin
										  red <= 8'b11111111;
                                green <= 8'b11111111;
                                blue <= 8'b11111111;
									end
                        1: begin  // Casilla no vacía (bomba)
                            if ((i + j) % 2 == 0) begin
                                red <= 8'b11111111;
                                green <= 8'b11111111;
                                blue <= 8'b11111111;
                            end else begin
                                red <= 8'b10101010;
                                green <= 8'b10101010;
                                blue <= 8'b10101010;
                            end
                        end
								2: begin
											red <= 8'b00000000;
											green <= 8'b00000000;
											blue <= 8'b10101010;
									end
								3: begin
											red <= 8'b11111111;
											green <= 8'b00000000;
											blue <= 8'b00000000;
									end
								4: begin
											red <= 8'b00000000;
											green <= 8'b00000000;
											blue <= 8'b00000000;
									end
                    endcase
                end
            end
        end
    endtask
endmodule