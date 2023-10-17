module TopModule(input logic clk,
			  input logic [2:0] i,
			  input logic [2:0] j,
			  input logic select,
			  output logic vga_clk,
			  output logic h_sync, v_sync,
			  output logic sync_b, blank_b, // To monitor & DAC
			  output logic [7:0] red, green, blue); // To video DAC
			  
	logic [9:0] x, y;
	logic [9:0] i_aux;
	logic [9:0] j_aux;
	
	
	assign i_aux = 80 + i*60;
	assign j_aux = j*60;
	
	pll vga_pll(.clk(clk), .vga_clk(vga_clk));
	
	// Generate monitor timing signals
	vga_controller vgaCont(vga_clk, h_sync, v_sync, sync_b, blank_b, x, y);
	
	// User-defined module to determine pixel color
	generate_grid gen_grid(x, y, i_aux, j_aux, select, red, green, blue);
endmodule