module video_controller #(
    parameter WIDTH = 640,
    parameter HEIGHT = 480
)
(
    input logic clock,
    output logic h_synq,
    output logic v_synq,
    output logic [3:0] red,
    output logic [3:0] green,
    output logic [3:0] blue,
    output logic clk_25MHz,
    output logic sync_n,
    output logic blank_n
);

    // Dimensiones de las celdas
    localparam CELL_WIDTH = WIDTH / 8;
    localparam CELL_HEIGHT = HEIGHT / 8;

    // Definir el color blanco (R=15, G=15, B=15)
    localparam WHITE_COLOR = 4'b1111;

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
assign blank_n = (h_count_value >= 96) && (h_count_value < 736) && (v_count_value >= 2) && (v_count_value < 482);

	
assign red = (h_count_value < 784 && h_count_value > 143 && v_count_value < 515 && v_count_value > 34) ? 4'hF: 4'h0;
assign green = (h_count_value < 784 && h_count_value > 143 && v_count_value < 515 && v_count_value > 34) ? 4'hF: 4'h0;
assign blue = (h_count_value < 784 && h_count_value > 143 && v_count_value < 515 && v_count_value > 34) ? 4'hF: 4'h0;

endmodule

	
	/*
	
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

	


	assign sync_n = 1'b0;
	assign blank_n = h_count_value & v_count_value;
 

	assign red = (h_count_value < 784 && h_count_value > 143 && v_count_value < 515 && v_count_value > 34) ? SNAKE_R: 4'b1111;
assign green = (h_count_value < 784 && h_count_value > 143 && v_count_value < 515 && v_count_value > 34) ? SNAKE_G: 4'b1111;
assign blue = (h_count_value < 784 && h_count_value > 143 && v_count_value < 515 && v_count_value > 34) ? SNAKE_B: 4'b1111;
endmodule


	

	always begin
    draw_game_screen();
end


	task draw_game_screen;
		for (int i = 0; i < ROWS; i++) begin
			for (int j = 0; j < COLS; j++) begin
				if (v_count_value >= (i * CELL_HEIGHT + 35) && v_count_value < ((i+1) * CELL_HEIGHT + 35) &&
						h_count_value >= (j * CELL_WIDTH + 144) && h_count_value < ((j+1) * CELL_WIDTH + 144)
				) begin
					red <= SNAKE_R;
						green <= SNAKE_G;
						blue <= SNAKE_B;
				end
			end
		end
	endtask

endmodule

*/