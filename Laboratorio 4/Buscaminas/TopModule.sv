module TopModule 
(
	 input logic clk,
    input logic rst//,
    //output wire hsync,
    //output wire vsync,
    //output wire [2:0] red,
    //output wire [2:0] green,
    //output wire [2:0] blue
);

	logic divided_clk;
	logic enable_V_Counter;
	logic [15:0] h_Count_Value;
	logic [15:0] v_Count_Value;
	logic T;
	logic C1;
	logic A; 
	logic C2;
	logic x;
	
	logic sync_n;
   logic blank_n;
	 
	wire hsync;
	wire vsync;
	wire [2:0] red;
   wire [2:0] green;
   wire [2:0] blue;
	
	
	FiniteStateMachine fsm (
			.clk(clk), 
			.rst(rst), 
			.T(T), 
			.C1(C1), 
			.A(A), 
			.C2(C2), 
			.x(x)
	);
	

   clock_divider clk_div (
			.clk(clk), 
			.divided_clk(divided_clk)
	);
	
  
   horizontal_counter h_counter (
			.clk_25MHz(divided_clk), 
			.enable_V_Counter(enable_V_Counter), 
			.h_Count_Value(h_Count_Value)
	);
	
	
	vertical_counter v_counter (
			.clk_25MHz(divided_clk), 
			.enable_V_Counter(enable_V_Counter), 
			.v_Count_Value(v_Count_Value)
	);
	
	
	VGA_Signal_Generator vga_s_g (
			.clk_25MHz(divided_clk), 
			.rst(rst), 
			.hsync(hsync), 
			.vsync(vsync), 
			.red(red), 
			.green(green), 
			.blue(blue)
	);

	
	video_controller #(640, 480, 8, 8) video_controller_inst (
        .clock(clk),
        .h_synq(hsync),
        .v_synq(vsync),
        .red(red),
        .green(green),
        .blue(blue),
        .clk_25MHz(divided_clk),
        .sync_n(sync_n),
        .blank_n(blank_n)
    );
	
	

endmodule