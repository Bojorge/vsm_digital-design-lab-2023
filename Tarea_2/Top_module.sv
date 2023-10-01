module Top_module(
  input clk, 
  input logic rst,
  input logic M, 
  input logic rst_manual,
  output reg [1:0] system_state,
  output reg [7:0] reg_data
);

 
  logic rst_timer, mux_cont, enable_mant, output_mux, t0;
  logic [1:0] current_state;
  
  wire [7:0] timer_out, data_reg_state_out, data_reg_mant_out;
  
   
  
  
  
  
  
  Register_state reg_state_inst (.clk(clk), .rst(rst), .data_in(output_mux), .data_out(data_reg_state_out));
  
  Timer timer_inst (.clk(clk), .rst(rst), .rst_timer(rst_timer), .timer_out(timer_out));
  
  Comparator comparator_inst (.timer_out(timer_out), .t0(t0));
  
  FSM fsm_inst (.clk(clk), .rst(rst), .M(M), .t0(t0), .rst_manual(rst_manual), .rst_timer(rst_timer), .enable_mant(enable_mant), .mux_cont(mux_cont), .current_state(current_state));
  
  Register_maintenance reg_maint_inst (.clk(clk), .rst(rst), .enable(enable_mant), .data_out(data_reg_mant_out));
  
  Mux mux_inst (.input1(data_reg_mant_out), .input2(8'hFF), .mux_cont(mux_cont), .output_mux(output_mux));
  
  assign system_state = current_state;
  assign reg_data = data_reg_state_out;

endmodule
