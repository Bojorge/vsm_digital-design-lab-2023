module TopModule(
			  input logic clk,
			  input logic rst,
			  input logic [2:0] i,
			  input logic [2:0] j,
			  input logic [3:0] mines_quantity,
			  input logic trigger,
			  input logic check,
			  input logic select,
			  output reg [6:0] segments,
			  output logic vga_clk,
			  output logic h_sync, v_sync,
			  output logic sync_b, blank_b, // To monitor & DAC
			  output logic [7:0] red, green, blue); // To video DAC
			  
	logic [9:0] x, y;
	logic [9:0] i_aux;
	logic [9:0] j_aux;
	
	logic [2:0] current_state;
	
	
	assign i_aux = 80 + i*61;
	assign j_aux = j*61;
	
	pll vga_pll(.clk(clk), .vga_clk(vga_clk));
	
	
	vga_controller vgaCont(vga_clk, h_sync, v_sync, sync_b, blank_b, x, y);
	
	FiniteStateMachine fsm (
			.clk(clk), 
			.rst(rst), 
			.trigger(trigger), 
			.win(win), 
			.mines(mines_quantity),
			.current_state(current_state)
	);
	
	 display display(
			.mines(mines_quantity),  
			.segments(segments)
	 );
	
	
	generate_graphic gen_grid(x, y, i_aux, j_aux, check, select, current_state, win, red, green, blue);
endmodule