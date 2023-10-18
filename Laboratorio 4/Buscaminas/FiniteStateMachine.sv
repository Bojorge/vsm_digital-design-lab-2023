module FiniteStateMachine(
									input logic clk, 
									input logic rst, 
									input logic trigger, 
									input logic win,
									input logic [3:0] mines,
									output [2:0] current_state);

logic [2:0] state = 3'b000; 
logic [2:0] next_state = 3'b000; 

//actual state logic
always_ff @(posedge clk)
	if (~rst) state = 3'b000;
	else
		state = next_state;

//next state logic
always_comb
	case (state)
        3'b000: if (~trigger & (mines > 4'b0000)) next_state = 3'b001; else next_state = 3'b000;
        3'b001: if (win) next_state = 3'b001; else next_state = 3'b001;
        3'b010: next_state = 3'b010;
        3'b011: next_state = 3'b011;
        default: next_state = 3'b000;
    endcase

	 
//output logic
assign current_state = state;	

endmodule