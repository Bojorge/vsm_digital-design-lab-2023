module FSM(
  input clk,
  input logic rst,
  input logic M,
  input logic t0,
  input logic rst_manual,
  output logic rst_timer,
  output logic enable_mant,
  output logic mux_cont,
  output logic [1:0] current_state
);

  logic [1:0] state, next_state;

  //actual state logic
  always_ff @(posedge clk or posedge rst)
    if (rst) state = 2'b00;
      
    else
      state = next_state;
    

  //next state logico
  always_comb
    case (state)
      2'b00: if (M) next_state = 2'b01; else next_state = 2'b10;
      
      2'b01: next_state = 2'b00;
      
      2'b10: if (t0) next_state = 2'b11; else next_state = 2'b00;
      
      2'b11: if (rst_manual) next_state = 2'b00; else next_state = 2'b11; 
      
      default: next_state = 2'b00;
        
    endcase
 
  //output logic
  assign rst_timer = (state == 2'b01) | (state == 2'b11);
  assign enable_mant = (state == 2'b01);
  assign mux_cont = (state == 2'b11) ? 1'b1 : 1'b0;
  
  assign current_state = state;

endmodule






/*
module FSM(
  input clk,
  input rst,
  input logic M,   
  input logic t0, 
  input logic rst_manual, 
  output reg rst_timer,
  output reg enable_mant,
  output reg mux_cont
);

  logic [1:0] state, next_state;

  // Lógica del estado actual
  always_ff @(posedge clk or posedge rst)
    if (rst) state <= 2'b00;
    else state <= next_state;

  // Lógica del próximo estado
  always_comb
    case(state)
      2'b00: if (M) next_state = 2'b01; else next_state = 2'b10;
      
      2'b01: next_state = 2'b00;
      
      2'b10: if (t0) next_state = 2'b11; else next_state = 2'b00;
      
      2'b11: if (rst_manual) next_state = 2'b00;
      
      default: next_state = 2'b00;
    endcase

  // Lógica de salida
  assign rst_timer = (state == 2'b10);
  assign enable_mant = (state == 2'b01);
  assign mux_cont = (state == 2'b11) ? 1'b1 : 1'b0;

endmodule
*/