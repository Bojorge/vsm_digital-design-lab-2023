module FiniteStateMachine(
									input logic clk, 
									input logic rst, 
									input logic T, 
									input logic C1, 
									input logic A, 
									input logic C2, 
									output x);

logic [2:0] state, next_state;

//actual state logic
always_ff @(posedge clk or posedge rst)
	if (rst) state = 3'b000;
	else
		state = next_state;

//next state logic
always_comb
	case (state)
        3'b000: if (T && C1) next_state = 3'b001; else next_state = 3'b000;
        3'b001: if (T) next_state = 3'b010; else next_state = 3'b001;
        3'b010: if (A) next_state = 3'b011; else if (!A) next_state = 3'b100;
        3'b011: next_state = 3'b001;
        3'b100: if (C2) next_state = 3'b101; else if (!C2) next_state = 3'b110;
        3'b101: next_state = 3'b000;
        3'b110: next_state = 3'b001;
        default: next_state = 3'b000;
    endcase

	 
//output logic
assign x = (state == 3'b000);	

endmodule