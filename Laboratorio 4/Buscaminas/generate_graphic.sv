module generate_graphic(input logic [9:0] x, y,
					 input logic [9:0] i, j,
					 input logic check,
					 input logic select,
					 input logic [2:0] current_state,
					 output logic win,
					 output logic [7:0] red, green, blue
);
logic inrectBGLeft;
logic inrectBGRight;
logic inrectPlayer;
logic inAreaRect;
logic screen;
logic checkCell;
logic selectCell;
logic [7:0] colorR, colorG, colorB;
	 
generate_rectangle rectBGLeft(x, y, 10'd0, 10'd0, 10'd80, 10'd480, inrectBGLeft);
generate_rectangle rectBGRight(x, y, 10'd560, 10'd0, 10'd640, 10'd480, inrectBGRight);
generate_rectangle rectPlayer(x, y, i, j, i+60, j+60, inrectPlayer);
	 
assign colorR = (current_state == 3'b000) ? 8'b00000000 : 8'b11110000;				  
assign colorG = (current_state == 3'b000) ? 8'b00000000 : 8'b11110000;					  
assign colorB = (current_state == 3'b000) ? 8'b00000000 : 8'b11110000;	 
assign inAreaRect = (x >= 80) && (x < 561) && ((x-80) % 61 < 60) && (y % 61 < 60);
assign screen = (current_state == 3'b000) ? 0 : inAreaRect;
assign checkCell = ((current_state == 3'b001) & inrectPlayer & ~check) ? 1 : 0;
assign selectCell = ((current_state == 3'b001) & inrectPlayer & ~select) ? 1 : 0;
assign win = (checkCell & 1) | ~selectCell;
	
assign red = (inrectBGLeft | inrectBGRight) ? 8'b11111111 : (selectCell ? 8'b11111111 : (checkCell ? 8'b00000000 : (inrectPlayer ? colorR : (screen ? 8'b10101010 : 8'b00000000))));
assign green = (inrectBGLeft | inrectBGRight) ? 8'b11111111 : (selectCell ? 8'b00000000 : (checkCell ? 8'b11111111 : (inrectPlayer ? colorG : (screen ? 8'b10101010 : 8'b00000000))));
assign blue = (inrectBGLeft | inrectBGRight) ? 8'b11111111 : (selectCell ? 8'b00000000 : (checkCell ? 8'b00000000 : (inrectPlayer ? colorB : (screen ? 8'b10101010 : 8'b00000000))));

endmodule

