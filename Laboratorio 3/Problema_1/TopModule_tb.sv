module TopModule_tb #(parameter N_bits = 32);

  // Entradas
  reg [3:0] opcode;
  reg [N_bits-1:0] a, b;

  // Salidas
  wire N, Z, C, V;
  wire [N_bits-1:0] result;

  TopModule #(N_bits) uut (
    .opcode(opcode),
    .a(a),
    .b(b),
    .N(N),
    .Z(Z),
    .C(C),
    .V(V),
    .result(result)
  );

  initial begin
    //_____________ 2 BITS ________________________
    opcode = 4'b0000;
    a = 2'b00;
    b = 2'b11;
    #10;
    $display("Suma >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);

    //_____________ 4 BITS ________________________
    opcode = 4'b0000;
    a = 4'b1000;
    b = 4'b0110;
    #10;
    $display("Suma >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
	 //_____________ 8 BITS ________________________
    opcode = 4'b0000;
    a = 8'b00101010;
    b = 8'b11110011;
    #10;
    $display("Suma >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
	 //_____________ 16 BITS ________________________
    opcode = 4'b0000;
    a = 16'b0000000000000000;
    b = 16'b1010101010101011;
    #10;
    $display("Suma >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
	 //_____________ 32 BITS ________________________
    opcode = 4'b0000;
    a = 32'b10101010101010111010101010101011;
    b = 32'b10101010101010111010101010101011;
    #10;
    $display("Suma >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
	 $finish;
	 
	 
  end
endmodule