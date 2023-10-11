module Comparator(
    input [0:7] x,
    input [0:7] y,
    input logic [7:0][7:0] gridMinasIn,
    output logic bomb
);

always @(x or y or gridMinasIn) begin
    if (x >= 0 && x < 8 && y >= 0 && y < 8) begin
        if (gridMinasIn[x][y] == 1'b1)
            bomb = 1'b1;
        else
            bomb = 1'b0;
    end else begin
        // Handle out-of-range indices, set bomb to 0 or any other appropriate action
        bomb = 1'b0; // Default behavior is no bomb for out-of-range indices
    end
end

endmodule
