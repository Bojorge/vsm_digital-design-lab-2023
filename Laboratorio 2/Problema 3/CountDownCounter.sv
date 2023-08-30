module CountDownCounter #(parameter N = 7)
                    (input clk,
                    input reset,
                    output reg [N-1:0] count);
    always @ (posedge clk or posedge reset)
        if (reset) count <= (1 << N) - 1;
        else count <= count - 1;
endmodule

