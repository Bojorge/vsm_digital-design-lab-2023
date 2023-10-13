module TopModule 
(
	 input logic clk,
    input logic rst, 
    output logic h_synq,
    output logic v_synq,
    output logic [7:0] red,
    output logic [7:0] green,
    output logic [7:0] blue,
	 output logic sync_n,
    output logic blank_n,
    output logic clk_25MHz
    
);


	
	logic T;
	logic C1;
	logic A; 
	logic C2;
	logic x;
	
	logic [2:0] grid [0:7][0:7];
	
		
	generateGrid gen_grid( 
			.grid(grid) 
	); 
	
	
	 
	clock_divider vga_clock_gen(
			.clk(clk), 
			.divided_clk(clk_25MHz)
	);
	
	
	FiniteStateMachine fsm (
			.clk(clk), 
			.rst(rst), 
			.T(T), 
			.C1(C1), 
			.A(A), 
			.C2(C2), 
			.x(x)
	);
	

	
	grid_controller #(640, 480, 8, 8) grid_controller_inst (
		  .grid(grid),
		  .clk_25MHz(clk_25MHz),
        .h_synq(h_synq),
        .v_synq(v_synq),
        .red(red),
        .green(green),
        .blue(blue),
        .sync_n(sync_n),
        .blank_n(blank_n)
    );
	
	

endmodule