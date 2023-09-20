module TopModule #(parameter N_bits = 4) 
(
	input wire clk,          // Señal de reloj
  input wire reset,        // Señal de reinicio
  input [3:0] opcode,
  input logic [N_bits-1:0] a,
  input logic [N_bits-1:0] b,
  output logic N,
  output logic Z,
  output logic C,
  output logic V,
  output logic [N_bits-1:0] result,
  output reg [6:0] segments
);

	 
  // Instancia del registro de entrada
  registers #(N_bits) input_reg (
    .clk(clk),
    .reset(reset),
    .data_in({opcode, a, b}), // Conectar las entradas de tu módulo al registro de entrada
    .data_out({opcode_reg, a_reg, b_reg}) // Conectar las salidas del registro de entrada a tus registros internos
  );

  // Instancia del registro de salida
  registers #(N_bits) output_reg (
    .clk(clk),
    .reset(reset),
    .data_in(result), // Conectar la salida de tu módulo al registro de salida
    .data_out(result_out) // Conectar la salida del registro de salida a la señal de salida result_out
  );
  


  logic [N_bits-1:0] b_complemento;
  
  logic [N_bits-1:0] result_sum;
  logic [N_bits-1:0] result_sum_parcial;
  logic [N_bits-1:0] cout_parcial;
  
  
  logic [N_bits-1:0] cout_parcial_sub;
  
  
  logic [N_bits-1:0] result_sub;
  logic [N_bits-1:0] result_sub_parcial;
  
  
  logic [2*N_bits-1:0] result_mul;
  
  logic [N_bits-1:0] result_div;
  
  logic [N_bits-1:0] result_mod;
  
  logic [N_bits-1:0] result_and;
  
  logic [N_bits-1:0] result_or;
  
  logic [N_bits-1:0] result_xor;
  
  logic [N_bits-1:0] result_shl;
  
  logic [N_bits-1:0] result_shr;
  
  
  assign b_complemento = ~b + 1'b1;
  
  
  
  
  /////////////////////////////////////////////////////////////////////////////////////
  
  generate
    genvar i;
    logic [N_bits-1:0] cin_parcial;
    assign cin_parcial[0] = 1'b0; // Inicializamos el primer bit de acarreo en cero
    for (i = 0; i < N_bits; i = i + 1) begin : generate_sumas
        suma add (
            .a(a[i]),
            .b(b[i]),
            .cin(cin_parcial[i]),
            .cout(cout_parcial[i]),
            .result(result_sum_parcial[i])
        );
        // El bit de acarreo de salida de esta instancia se convierte en el acarreo de entrada de la siguiente
        if (i < N_bits - 1) begin
            assign cin_parcial[i+1] = cout_parcial[i];
        end
    end
	endgenerate
  
  ////////////////////////////////////////////////////////////////////////////////////
   
	generate
	genvar j;
    logic [N_bits-1:0] cin_parcial_sub;
    assign cin_parcial_sub[0] = 1'b0; // Inicializamos el primer bit de acarreo en cero
    for (j = 0; j < N_bits; j = j + 1) begin : generate_restas
        suma sub (
            .a(a[j]),
            .b(b_complemento[j]),
            .cin(cin_parcial_sub[j]),
            .cout(cout_parcial_sub[j]),
            .result(result_sub_parcial[j])
        );
        // El bit de acarreo de salida de esta instancia se convierte en el acarreo de entrada de la siguiente
        if (j < N_bits - 1) begin
            assign cin_parcial_sub[j+1] = cout_parcial_sub[j];
        end
    end
	endgenerate
	
  ////////////////////////////////////////////////////////////////////////////////////
  
   

	multiplicacion #(N_bits) mult (
    .a(a),           
    .b(b),          
    .result(result_mul)  
  );


  
  ////////////////////////////////////////////////////////////////////////////////////
  
  division #(N_bits) div (
    .a(a),           
    .b(b),           
    .result(result_div)
  );
  
  ////////////////////////////////////////////////////////////////////////////////////
  
  modulo #(N_bits) mod (
    .a(a),           
    .b(b),           
    .result(result_mod)
  );
  
  
  ///////////////////////////////////////////////////////////////////////////////////
  
  
  and_gate #(N_bits) and_gate (
    .a(a),           
    .b(b),           
    .result(result_and)
  );
  
  
  ////////////////////////////////////////////////////////////////////////////////////
  
  or_gate #(N_bits) or_gate (
    .a(a),           
    .b(b),           
    .result(result_or)
  );
  
  ////////////////////////////////////////////////////////////////////////////////////
  
  xor_gate #(N_bits) xor_gate (
    .a(a),           
    .b(b),           
    .result(result_xor)
  );
  
  ////////////////////////////////////////////////////////////////////////////////////
  
  shiftLeft #(N_bits) shl (
    .a(a),           
    .b(b),           
    .result(result_shl)
  );
  
  ////////////////////////////////////////////////////////////////////////////////////
  
  shiftRight #(N_bits) shr (
    .a(a),           
    .b(b),           
    .result(result_shr)
  );

  ////////////////////////////////////////////////////////////////////////////////////
  
  
 
  always_comb begin
    case (opcode)
      4'b0000: // Suma
        result = result_sum_parcial;
      4'b0001: // Resta
        if (b > a) begin
			 result = ~result_sub_parcial + 1'b1;
		  end
		  else begin
			 result = result_sub_parcial;
		  end
      4'b0010: // Multiplicación
        result = result_mul;
      4'b0011: // División
        result = result_div;
      4'b0100: // Módulo
        result = result_mod;
      4'b0101: // AND
        result = result_and;
      4'b0110: // OR
        result = result_or;
      4'b0111: // XOR
        result = result_xor;
      4'b1000: // Desplazamiento a la izquierda
        result = result_shl;
      4'b1001: // Desplazamiento a la derecha
        result = result_shr;
      default: // Opción no válida
        // Configura señales de salida en caso de opcode no válido
        result = {N_bits{1'b0}};
		  //segments = 7'b1111111;  // Apagar todos los segmentos
    endcase
    
	 
	 N = 1'b0;
	 
		 
	 if (result == {N_bits{1'b0}}) begin
		 Z = 1'b1;
	 end else begin
		 Z = 1'b0;
	 end
     
	 if (result >= {N_bits{1'b1}}) begin
		 V = 1'b1;
	 end else begin
		 V = 1'b0;
	 end
	 
	 if (opcode == 4'b0000) begin
		 C = cout_parcial[N_bits-1];
	end else if (opcode == 4'b0001) begin
		 if (b > a) begin
			  N = 1'b1;
		 end
		 C = cout_parcial_sub[N_bits-1];
	end else begin
		 C = 1'b0;
	end


	 case (result)
	  4'b0000: segments = 7'b1000000; // Dígito 0
	  4'b0001: segments = 7'b1111001; // Dígito 1
	  4'b0010: segments = 7'b0100100; // Dígito 2
	  4'b0011: segments = 7'b0110000; // Dígito 3
	  4'b0100: segments = 7'b0011001; // Dígito 4
	  4'b0101: segments = 7'b0010010; // Dígito 5
	  4'b0110: segments = 7'b0000010; // Dígito 6
	  4'b0111: segments = 7'b1111000; // Dígito 7
	  4'b1000: segments = 7'b0000000; // Dígito 8
	  4'b1001: segments = 7'b0011000; // Dígito 9
	  4'b1010: segments = 7'b0001000; // Dígito A (10 en hexadecimal)
	  4'b1011: segments = 7'b0000011; // Dígito B (11 en hexadecimal)
	  4'b1100: segments = 7'b1000110; // Dígito C (12 en hexadecimal)
	  4'b1101: segments = 7'b0100001; // Dígito D (13 en hexadecimal)
	  4'b1110: segments = 7'b0000110; // Dígito E (14 en hexadecimal)
	  4'b1111: segments = 7'b0001110; // Dígito F (15 en hexadecimal)
	  default: segments = 7'b1111111;  // Apagar todos los segmentos
	endcase
    
  end
  
  

endmodule
