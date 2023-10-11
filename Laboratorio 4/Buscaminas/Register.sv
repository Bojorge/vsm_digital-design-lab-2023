module Register (
    input wire clk,
    input wire reset,
    input logic [1:0] gridMinasIn [0:7][0:7],  
    output logic [1:0] gridMinasOut [0:7][0:7]     
);

reg registro; 

logic [1:0] gridRst [0:7][0:7]  = '{default: 2'b00 };

always @(posedge clk or posedge reset) begin
    if (reset) begin
        registro <= gridRst; // Reset -> Matriz vacia (estado neutral)
    end else begin
        registro <= gridMinasIn; //Guarda el grid con las minas 
    end
end

assign gridMinasOut = registro; // La salida del registro es igual al valor almacenado en el registro

endmodule
