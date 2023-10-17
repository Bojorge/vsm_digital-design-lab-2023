module FiniteStateMachine(
									input logic clk, 
									input logic rst, 
									input logic trigger, 
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
        3'b000: if (~trigger) next_state = 3'b001; else next_state = 3'b000;
        3'b001: if (~trigger) next_state = 3'b010; else next_state = 3'b001;
        3'b010: if (~trigger) next_state = 3'b011; else next_state = 3'b010;
        3'b011: if (~trigger) next_state = 3'b100; else next_state = 3'b011;
        3'b100: if (~trigger) next_state = 3'b101; else next_state = 3'b100;
        3'b101: if (~trigger) next_state = 3'b110; else next_state = 3'b101;
        3'b110: if (~trigger) next_state = 3'b111; else next_state = 3'b110;
		  3'b111: if (~trigger) next_state = 3'b000; else next_state = 3'b111;
        default: next_state = 3'b000;
    endcase

	 
//output logic
assign current_state = state;	

endmodule