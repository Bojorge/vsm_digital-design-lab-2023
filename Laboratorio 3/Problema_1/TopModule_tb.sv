module TopModule_tb;

  localparam N_bits = 4;
  // Entradas
  reg [3:0] opcode;
  reg [N_bits-1:0] a, b;
  // Salidas
  wire N, Z, C, V;
  wire [N_bits-1:0] result;
  
  

  // Instancia del módulo bajo prueba
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
    $display("-------------------------------------------------------------------------------------");
    $display("-------------------------------------------------------------------------------------");
     
    // Suma
    opcode = 4'b0000;
    a = 4'b1000;
    b = 4'b0110;
    #10;
    $display("Suma >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
	 #10;
	 
	 a = 4'b0111;
    b = 4'b1000;
    #10;
    $display("Suma >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
	 
	 a = 4'b0000;
    b = 4'b0000;
    #10;
    $display("Suma >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
	 
    $display("-------------------------------------------------------------------------------------");
    $display("-------------------------------------------------------------------------------------");
    
    // Resta
    opcode = 4'b0001;
    a = 4'b1000;
    b = 4'b0010;
    #10;
    $display("Resta >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
	 
	 a = 4'b0010;
    b = 4'b1000;
    #10;
    $display("Resta >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
	 
	 a = 4'b0000;
    b = 4'b0000;
    #10;
    $display("Resta >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
     
    $display("-------------------------------------------------------------------------------------");
    $display("-------------------------------------------------------------------------------------");
     
    // Multiplicación
    opcode = 4'b0010;
    a = 4'b0011;
    b = 4'b0011;
    #10;
    $display("Multiplicacion >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
     
	 a = 4'b0111;
    b = 4'b0010;
    #10;
    $display("Multiplicacion >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
     
	 a = 4'b1000;
    b = 4'b0010;
    #10;
    $display("Multiplicacion >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
      
	 
    $display("-------------------------------------------------------------------------------------");
    $display("-------------------------------------------------------------------------------------");

    // División
    opcode = 4'b0011;
    a = 4'b0100;
    b = 4'b0010;
    #10;
    $display("Division >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
	 
	 a = 4'b1001;
    b = 4'b0011;
    #10;
    $display("Division >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
	 
	 a = 4'b1001;
    b = 4'b0110;
    #10;
    $display("Division >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
     
    $display("-------------------------------------------------------------------------------------");
    $display("-------------------------------------------------------------------------------------");

    // Módulo
    opcode = 4'b0100;
    a = 4'b1111;
    b = 4'b0100;
    #10;
    $display("Modulo >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
     
	 a = 4'b0110;
    b = 4'b0010;
    #10;
    $display("Modulo >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
     
	 a = 4'b1010;
    b = 4'b0110;
    #10;
    $display("Modulo >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
     
    $display("-------------------------------------------------------------------------------------");
    $display("-------------------------------------------------------------------------------------");

    // And
    opcode = 4'b0101;
    a = 4'b1010;
    b = 4'b1001;
    #10;
    $display("And >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
     
	 a = 4'b0110;
    b = 4'b0110;
    #10;
    $display("And >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
     
	 a = 4'b0000;
    b = 4'b0000;
    #10;
    $display("And >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
     
    $display("-------------------------------------------------------------------------------------");
    $display("-------------------------------------------------------------------------------------");
     
    // Or
    opcode = 4'b0110;
    a = 4'b1010;
    b = 4'b1001;
    #10;
    $display("Or >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
     
	 a = 4'b0110;
    b = 4'b0110;
    #10;
    $display("Or >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
     
	 a = 4'b0000;
    b = 4'b0000;
    #10;
    $display("Or >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
     
    $display("-------------------------------------------------------------------------------------");
    $display("-------------------------------------------------------------------------------------");
     
    // Xor
    opcode = 4'b0111;
    a = 4'b1010;
    b = 4'b0110;
    #10;
    $display("Xor >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
     
	 a = 4'b0101;
    b = 4'b0110;
    #10;
    $display("Xor >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
     
	 a = 4'b1010;
    b = 4'b1001;
    #10;
    $display("Xor >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
     
    $display("-------------------------------------------------------------------------------------");
    $display("-------------------------------------------------------------------------------------");
       
    // Shift left
    opcode = 4'b1000;
    a = 4'b0010;
    b = 4'b0001;
    #10;
    $display("Shift left >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
     
	 a = 4'b0001;
    b = 4'b0011;
    #10;
    $display("Shift left >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
     
	 a = 4'b0010;
    b = 4'b0010;
    #10;
    $display("Shift left >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
     
    $display("-------------------------------------------------------------------------------------");
    $display("-------------------------------------------------------------------------------------");
         
    // Shift right
    opcode = 4'b1001;
    a = 4'b0010;
    b = 4'b0001;
    #10;
    $display("Shift right >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
     
	 a = 4'b1000;
    b = 4'b0011;
    #10;
    $display("Shift right >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
     
	 a = 4'b1000;
    b = 4'b0001;
    #10;
    $display("Shift right >>> Resultado: %b, a: %b, b: %b, N: %b, Z: %b, C: %b, V: %b", result, a, b, N, Z, C, V);
     
    $display("-------------------------------------------------------------------------------------");
    $display("-------------------------------------------------------------------------------------");
      
  end

endmodule
