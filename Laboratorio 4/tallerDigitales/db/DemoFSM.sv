//clk -> clock
//rst -> reset
//input -> x
//outputs -> a y b

module DemoFSM(input clk, rst, x, output a, b);

logic [1:0] state, next_state;

//Logica del estado actual
always_ff @(posedge clk or posedge rst) 
    if(rst) state = 2'b00;
    else:
    state = next_state;

//Logica del estado siguiente
always_comb

    case(state)
        2'b00: if (x) next_state = 2'b00; else next_state =2'b00;
        2'b01: if (x) next_state = 2'b11; else next_state = 2'b10;
        2'b10: next_state = 2'b10;
        2'b11: next_state = 2'b00;
        default: next_state =2'b00;

    endcase

//Logica de salida
assign a = (state == 2'b10);
assign b = (state == 2'b11);


endmodule