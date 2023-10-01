module FSM_2 (
  input clk,
  input rst,
  input x,
  output reg [1:0] current_state,
  output reg [7:0] reg_state
);

  reg [1:0] state, next_state;
  reg M, t0;
  reg rst_timer, mux_cont, enable_mant;
  wire [7:0] timer_out, data_reg_state_out, data_reg_mant_out, output_mux;

  //assign rst_timer = 1'b0;
  assign M = x;

  Timer timer_inst (.clk(clk), .rst(rst), .rst_timer(rst_timer), .timer_out(timer_out));
  Comparator comparator_inst (.timer_out(timer_out), .t0(t0));
  Register_maintenance reg_maint_inst (.clk(clk), .rst(rst), .enable(enable_mant), .data_out(data_reg_mant_out));
  Mux mux_inst (.input1(data_reg_mant_out), .input2(8'hFF), .mux_cont(mux_cont), .output_mux(output_mux));
  Register_state reg_state_inst (.clk(clk), .rst(rst), .data_in(output_mux), .data_out(data_reg_state_out));

  // Lógica de estado actual
  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      state = 2'b00;
    end else begin
      state = next_state;
    end
  end

  // Lógica de próximo estado
  always @* begin
    case (state)
      2'b00: begin // Esperando Botón 
			
        if (M) begin
          next_state = 2'b01;
        end else begin
          next_state = 2'b10;
        end
      end

      2'b01: begin // Contando 
		  enable_mant = 1'b1;
		  mux_cont = 1'b0;
        reg_state = data_reg_state_out; 
		
        next_state = 2'b00;
      end

      2'b10: begin // Verifica el timer
        
        if (t0) begin
          next_state = 2'b00;
        end else begin
          next_state = 2'b11;
        end
      end

      2'b11: begin	// Error
        mux_cont = 1'b1;
        reg_state = data_reg_state_out;
		  rst_timer = 1'b1;
		  
        if (x) begin
          next_state = 2'b00;
        end else begin
          next_state = 2'b11;
        end
      end

      default: begin
        next_state = 2'b00;
      end
    endcase
  end

  // Salida de estado actual
  assign current_state = state;
endmodule
