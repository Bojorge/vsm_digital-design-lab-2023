module video_controller #(
    parameter WIDTH = 640,
    parameter HEIGHT = 480,
	 parameter ROWS = 8,
	parameter COLS = 8
)
(
    input logic clock,
    output logic h_synq,
    output logic v_synq,
    output logic [7:0] red,
    output logic [7:0] green,
    output logic [7:0] blue,
	 
    output logic clk_25MHz,
    output logic sync_n,
    output logic blank_n
);

    // Dimensiones de las celdas
localparam CELL_WIDTH = WIDTH / COLS;
localparam CELL_HEIGHT = HEIGHT / ROWS;
localparam BOMB_R = 8'b11111111;
localparam BOMB_G = 8'b00000000;
localparam BOMB_B = 8'b00000000;







    // VGA variables de control
    logic enable_v_counter;
    logic [15:0] h_count_value;
    logic [15:0] v_count_value;

    // Clock divider
    clock_divider vga_clock_gen(clock, clk_25MHz);

    // Contadores
    horizontal_counter vga_horizontal (clk_25MHz, enable_v_counter, h_count_value);
    vertical_counter vga_vertical (clk_25MHz, enable_v_counter, v_count_value);

    // Sincronización vertical y horizontal basada en estándares VGA
    assign h_synq = (h_count_value < 96) ? 1'b1 : 1'b0;
    assign v_synq = (v_count_value < 2) ? 1'b1 : 1'b0;

    // Asignación de colores a blanco en toda la pantalla


// Zona activa de la pantalla (pantalla en blanco)
assign blank_n = (h_count_value >= 96) && (h_count_value < 799) && (v_count_value >= 2) && (v_count_value < 524);
//assign sync_n = 1'b0;
//assign blank_n = (h_count_value < 639) && (v_count_value < 479);

/*
assign red = (h_count_value < 784 && h_count_value > 143 && v_count_value < 515 && v_count_value > 34) ? 4'hF: 4'h0;
assign green = (h_count_value < 784 && h_count_value > 143 && v_count_value < 515 && v_count_value > 34) ? 4'hF: 4'h0;
assign blue = (h_count_value < 784 && h_count_value > 143 && v_count_value < 515 && v_count_value > 34) ? 4'hF: 4'h0;
*/


	// Asignar colores a la cuadrícula o al fondo



	
logic grid [7:0][7:0] = '{
    '{1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b1,1'b0},
    '{1'b0,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1},
    '{1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b1,1'b0},
    '{1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b0,1'b0},
    '{1'b0,1'b0,1'b10,1'b0,1'b0,1'b1,1'b1,1'b1},
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0},
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0},
    '{1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b1,1'b0}
};


	always begin
    draw_game_screen();
	end

	task draw_game_screen;
		for (int i = 0; i < ROWS; i++) begin
			for (int j = 0; j < COLS; j++) begin
				if (v_count_value >= (i * CELL_HEIGHT + 35) && v_count_value < ((i+1) * CELL_HEIGHT + 35) &&
						h_count_value >= (j * CELL_WIDTH + 144) && h_count_value < ((j+1) * CELL_WIDTH + 144)
					) begin
					if(grid[i][j]) begin
						red <= BOMB_R;
						green <= BOMB_G;
						blue <= BOMB_B;
					end
					else begin
						red <= 8'b00000000;
						green <= 8'b00000000;
						blue <= 8'b00000000;	
					end
				end
			end
		end
	endtask
endmodule

