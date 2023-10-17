module generate_graphic(input logic [9:0] x, y,
					 input logic [9:0] i, j,
					 input logic [2:0] current_state,
					 output logic [7:0] red, green, blue
);
    
	 logic inrectBGLeft;
    logic inrectBGRight;
	 logic inrectMarca;
	 
	 logic inAreaRect; // Área para cambiar color
	 
	 logic [7:0] colorR, colorG, colorB;
	 
	 
	 assign colorR = (current_state == 3'b000) ? 8'b11111111 : 
						  (current_state == 3'b001) ? 8'b00000000 : 
						  (current_state == 3'b010) ? 8'b00000000 : 
						  (current_state == 3'b011) ? 8'b00111111 : 
						  (current_state == 3'b100) ? 8'b00000000 : 
						  (current_state == 3'b101) ? 8'b00000000 : 
						  (current_state == 3'b110) ? 8'b10000111 : 
						  (current_state == 3'b111) ? 8'b11111111 : 8'b00000000;

	 assign colorG = (current_state == 3'b000) ? 8'b00000000 : 
						  (current_state == 3'b001) ? 8'b11111111 : 
						  (current_state == 3'b010) ? 8'b00000000 : 
						  (current_state == 3'b011) ? 8'b00000111 : 
						  (current_state == 3'b100) ? 8'b11111111 : 
						  (current_state == 3'b101) ? 8'b00000000 : 
						  (current_state == 3'b110) ? 8'b01111000 : 
						  (current_state == 3'b111) ? 8'b11111111 : 8'b00000000;

	 assign colorB = (current_state == 3'b000) ? 8'b00000000 : 
						  (current_state == 3'b001) ? 8'b00000000 : 
						  (current_state == 3'b010) ? 8'b11111111 : 
						  (current_state == 3'b011) ? 8'b00000111 : 
						  (current_state == 3'b100) ? 8'b00000000 : 
						  (current_state == 3'b101) ? 8'b11111111 : 
						  (current_state == 3'b110) ? 8'b01111000 : 
						  (current_state == 3'b111) ? 8'b11111111 : 8'b00000000;

	 
    // Rectangulo lateral izq
    generate_rectangle rectBGLeft(x, y, 10'd0, 10'd0, 10'd80, 10'd480, inrectBGLeft);
	 
    // Rectangulo lateral der
    generate_rectangle rectBGRight(x, y, 10'd560, 10'd0, 10'd640, 10'd480, inrectBGRight);
	 
	 generate_rectangle rectMarca(x, y, i, j, i+60, j+60, inrectMarca);
	 
	 
	 assign inAreaRect = (x >= 80) && (x < 560) && ((x-80) % 61 < 60) && (y % 61 < 60);
	 assign inAreaMarcada = (i >= 80) && (i < 560) && ((i-80) % 61 < 60) && (j % 61 < 60);
	
	 
	// Definir colores para las áreas específicas
	assign red = (inrectBGLeft | inrectBGRight) ? 8'b11111111 : (inrectMarca ? colorR : (inAreaRect ? 8'b10101010 : 8'b00000000));
	assign green = (inrectBGLeft | inrectBGRight) ? 8'b11111111 : (inrectMarca ? colorG : (inAreaRect ? 8'b10101010 : 8'b00000000));
	assign blue = (inrectBGLeft | inrectBGRight) ? 8'b11111111 : (inrectMarca ? colorB : (inAreaRect ? 8'b10101010 : 8'b00000000));

	 
	 
    
endmodule



