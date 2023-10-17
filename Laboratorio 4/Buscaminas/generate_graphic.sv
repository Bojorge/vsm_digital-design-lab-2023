module generate_graphic(input logic [9:0] x, y,
					 input logic [9:0] i, j,
					 input logic [2:0] current_state,
					 output logic [7:0] red, green, blue
);
    
	 logic inrectBGLeft;
    logic inrectBGRight;
	 logic inrectMarca;
	 
	 logic inAreaRect; // Área para cambiar color
	 logic screen;
	 logic icon;
	 
	 logic [7:0] colorR, colorG, colorB;
	 
	 
	 
	 assign colorR = (current_state == 3'b000) ? 8'b00000000 : 8'b11110000;
						  

	 assign colorG = (current_state == 3'b000) ? 8'b00000000 : 8'b11110000;
						  

	 assign colorB = (current_state == 3'b000) ? 8'b00000000 : 8'b11110000;
						 

	 
    // Rectangulo lateral izq
    generate_rectangle rectBGLeft(x, y, 10'd0, 10'd0, 10'd80, 10'd480, inrectBGLeft);
	 
    // Rectangulo lateral der
    generate_rectangle rectBGRight(x, y, 10'd560, 10'd0, 10'd640, 10'd480, inrectBGRight);
	 
	 generate_rectangle rectMarca(x, y, i, j, i+60, j+60, inrectMarca);
	 
	 //icon gen_icon (.sel(4'b0000), .x(x), .y(y), .icon(icon));
	 
	 
	 assign inAreaRect = (x >= 80) && (x < 560) && ((x-80) % 61 < 60) && (y % 61 < 60);
	 //assign inAreaMarcada = (i >= 80) && (i < 560) && ((i-80) % 60 < 60) && (j % 60 < 60);
	 
	 assign screen = (current_state == 3'b000) ? 0 : inAreaRect;
	
	 
	// Definir colores para las áreas específicas
	assign red = (inrectBGLeft | inrectBGRight) ? 8'b11111111 : (inrectMarca ? colorR : (screen ? 8'b10101010 : 8'b00000000));
	assign green = (inrectBGLeft | inrectBGRight) ? 8'b11111111 : (inrectMarca ? colorG : (screen ? 8'b10101010 : 8'b00000000));
	assign blue = (inrectBGLeft | inrectBGRight) ? 8'b11111111 : (inrectMarca ? colorB : (screen ? 8'b10101010 : 8'b00000000));

	 
	 
    
endmodule



