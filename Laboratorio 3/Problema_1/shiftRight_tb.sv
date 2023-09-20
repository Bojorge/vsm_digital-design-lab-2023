module shiftRight_tb;

  logic a;
  logic b;
  logic [2:0] result;

  shiftRight uut (
    .a(a),
    .b(b),
    .result(result)
  );

  initial begin
    
	 a = 1'b1;
    b = 1'b1;
	 #10;
    
    $display("Valor de a: %b", a);
	 $display("Valor de b: %b", b);
	 
	 $display("El resultado es: %b", result);
	 #10;
	 
	 a = 1'b0;
    b = 1'b1;
	 #10;
    
    $display("Valor de a: %b", a);
	 $display("Valor de b: %b", b);
	 
	 $display("El resultado es: %b", result);
	 #10;
	 
	 a = 1'b1;
    b = 1'b0;
	 #10;
    
    $display("Valor de a: %b", a);
	 $display("Valor de b: %b", b);
	 
	 $display("El resultado es: %b", result);
	 #10;
	 
	 a = 1'b0;
    b = 1'b0;
	 #10;
    
    $display("Valor de a: %b", a);
	 $display("Valor de b: %b", b);
	 
	 $display("El resultado es: %b", result);
	 #10;
    
  end

endmodule