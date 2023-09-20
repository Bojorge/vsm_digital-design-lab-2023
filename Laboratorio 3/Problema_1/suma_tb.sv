
module suma_tb;

	logic a, b, cin;
   logic cout;
   logic result;

   suma uut (
        .a(a),
        .b(b),
        .cin(cin),
        .cout(cout),
        .result(result)
    );

  initial begin
		a = 1'b1;
      b = 1'b1;
      cin = 1'b0;
      #10;

      $display("Valor de a: %b", a);
      $display("Valor de b: %b", b);
      $display("Acarreo de entrada: %b", cin);
      $display("El resultado es: %b", result);
      $display("Acarreo de salida: %b", cout);
      #10;
		
		a = 1'b1;
      b = 1'b1;
      cin = 1'b1;
      #10;

      $display("Valor de a: %b", a);
      $display("Valor de b: %b", b);
      $display("Acarreo de entrada: %b", cin);
      $display("El resultado es: %b", result);
      $display("Acarreo de salida: %b", cout);
      #10;
		
		///////////////////////////////////////////////////////
		
		a = 1'b0;
      b = 1'b1;
      cin = 1'b0;
      #10;

      $display("Valor de a: %b", a);
      $display("Valor de b: %b", b);
      $display("Acarreo de entrada: %b", cin);
      $display("El resultado es: %b", result);
      $display("Acarreo de salida: %b", cout);
      #10;
		
		a = 1'b0;
      b = 1'b1;
      cin = 1'b1;
      #10;

      $display("Valor de a: %b", a);
      $display("Valor de b: %b", b);
      $display("Acarreo de entrada: %b", cin);
      $display("El resultado es: %b", result);
      $display("Acarreo de salida: %b", cout);
      #10;
		
		///////////////////////////////////////////////////////
		
		a = 1'b1;
      b = 1'b0;
      cin = 1'b0;
      #10;

      $display("Valor de a: %b", a);
      $display("Valor de b: %b", b);
      $display("Acarreo de entrada: %b", cin);
      $display("El resultado es: %b", result);
      $display("Acarreo de salida: %b", cout);
      #10;
		
		a = 1'b1;
      b = 1'b0;
      cin = 1'b1;
      #10;

      $display("Valor de a: %b", a);
      $display("Valor de b: %b", b);
      $display("Acarreo de entrada: %b", cin);
      $display("El resultado es: %b", result);
      $display("Acarreo de salida: %b", cout);
      #10;
		
		///////////////////////////////////////////////////////
		
		a = 1'b0;
      b = 1'b0;
      cin = 1'b0;
      #10;

      $display("Valor de a: %b", a);
      $display("Valor de b: %b", b);
      $display("Acarreo de entrada: %b", cin);
      $display("El resultado es: %b", result);
      $display("Acarreo de salida: %b", cout);
      #10;
		
		a = 1'b0;
      b = 1'b0;
      cin = 1'b1;
      #10;

      $display("Valor de a: %b", a);
      $display("Valor de b: %b", b);
      $display("Acarreo de entrada: %b", cin);
      $display("El resultado es: %b", result);
      $display("Acarreo de salida: %b", cout);
      #10;
	 
    
  end

endmodule








