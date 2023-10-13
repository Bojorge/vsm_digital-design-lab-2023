//Generar un grid 8x8
module generateGrid ( 
	 output logic [2:0] grid [0:7][0:7] 
); 
 
integer i, j; 


initial begin 
    for (i = 0; i < 8; i = i + 1) begin 
        for (j = 0; j < 8; j = j + 1) begin 
				grid[i][j] = 3'b001;
        end 
    end 
end 

endmodule