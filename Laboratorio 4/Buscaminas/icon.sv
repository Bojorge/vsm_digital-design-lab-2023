module icon(input logic[3:0] sel, input logic[9:0] x, y, output logic icon);

	logic cero, cero_1, cero_2, cero_3, cero_4;
	logic uno, uno_1, uno_2, uno_3;
	logic dos, dos_1, dos_2, dos_3, dos_4, dos_5;
	logic tres, tres_1, tres_2, tres_3, tres_4;
	logic cuatro, cuatro_1, cuatro_2, cuatro_3;
	logic cinco, cinco_1, cinco_2, cinco_3, cinco_4, cinco_5;
	logic seis, seis_1, seis_2, seis_3, seis_4, seis_5;
	logic siete, siete_1, siete_2;
	logic ocho, ocho_1, ocho_2, ocho_3, ocho_4, ocho_5;
	//logic nueve, nueve_1, nueve_2, nueve_3, nueve_4, nueve_5;
	logic bomba, bomba_1, bomba_2, bomba_3;
	logic flag, flag_1, flag_2, flag_3, flag_4, flag_5;
	logic select, select_1;

	logic [9:0] x_aux, y_aux;
	
	assign x_matrix = (x>=90 && x<= 130) ? 0 : (x>150 && x<= 190) ? 1 : (x>210 && x<= 250) ? 2 :(x>270 && x<= 310) ? 3 :(x>330 && x<= 370) ? 4 :(x>380 && x<= 430) ? 5 :(x>450 && x<= 490) ? 6 :(x>510 && x<= 550) ? 7 : 0;
	assign y_matrix = (y>=10  && y<= 50) ? 0  : (y>70 && y<= 110) ? 1  : (y>130 && y<= 170) ? 2 :(y>190 && y<= 230) ? 3 :(y>250 && y<= 290) ? 4 :(y>310 && y<= 350) ? 5 :(y>370 && y<= 410) ? 6 :(y>430 && y<= 470) ? 7 : 0;	
	
	assign x_aux = 90 + (x * 60);
	assign y_aux = y * 60;
	
	generate_rectangle rectCero1   (x, y, x_aux + 15, x_aux + 45, y_aux + 10, y_aux + 20, cero_1);
	generate_rectangle rectCero2   (x, y, x_aux + 15, x_aux + 45, y_aux + 40, y_aux + 50, cero_2);
	generate_rectangle rectCero3   (x, y, x_aux + 15, x_aux + 25, y_aux + 20, y_aux + 40, cero_3);
	generate_rectangle rectCero4   (x, y, x_aux + 35, x_aux + 45, y_aux + 20, y_aux + 40, cero_4);
	
	generate_rectangle rectUno1    (x, y, x_aux + 15, x_aux + 45, y_aux + 40, y_aux + 50, uno_1);	
	generate_rectangle rectUno2    (x, y, x_aux + 25, x_aux + 35, y_aux + 20, y_aux + 40, uno_2);	
	generate_rectangle rectUno3    (x, y, x_aux + 15, x_aux + 35, y_aux + 10, y_aux + 20, uno_3);
	
	generate_rectangle rectDos1    (x, y, x_aux + 15, x_aux + 45, y_aux + 42, y_aux + 50, dos_1);	
	generate_rectangle rectDos2    (x, y, x_aux + 15, x_aux + 25, y_aux + 34, y_aux + 42, dos_2);	
	generate_rectangle rectDos3    (x, y, x_aux + 15, x_aux + 45, y_aux + 26, y_aux + 34, dos_3);	
	generate_rectangle rectDos4    (x, y, x_aux + 35, x_aux + 45, y_aux + 18, y_aux + 26, dos_4);	
	generate_rectangle rectDos5    (x, y, x_aux + 15, x_aux + 45, y_aux + 10, y_aux + 18, dos_5);	
	
	generate_rectangle rectTres1   (x, y, x_aux + 15, x_aux + 35, y_aux + 10, y_aux + 18, tres_1);	
	generate_rectangle rectTres2   (x, y, x_aux + 25, x_aux + 35, y_aux + 26, y_aux + 34, tres_2);	
	generate_rectangle rectTres3   (x, y, x_aux + 15, x_aux + 35, y_aux + 42, y_aux + 50, tres_3);	
	generate_rectangle rectTres4   (x, y, x_aux + 35, x_aux + 45, y_aux + 10, y_aux + 50, tres_4);	
	
	generate_rectangle rectCuatro1 (x, y, x_aux + 35, x_aux + 45, y_aux + 10, y_aux + 50, cuatro_1);	
	generate_rectangle rectCuatro2 (x, y, x_aux + 15, x_aux + 25, y_aux + 10, y_aux + 30, cuatro_2);	
	generate_rectangle rectCuatro3 (x, y, x_aux + 25, x_aux + 35, y_aux + 20, y_aux + 30, cuatro_3);	
	
	generate_rectangle rectCinco1  (x, y, x_aux + 15, x_aux + 45, y_aux + 10, y_aux + 18, cinco_1);	
	generate_rectangle rectCinco2  (x, y, x_aux + 15, x_aux + 25, y_aux + 18, y_aux + 26, cinco_2);	
	generate_rectangle rectCinco3  (x, y, x_aux + 15, x_aux + 45, y_aux + 26, y_aux + 34, cinco_3);	
	generate_rectangle rectCinco4  (x, y, x_aux + 35, x_aux + 45, y_aux + 34, y_aux + 42, cinco_4);	
	generate_rectangle rectCinco5  (x, y, x_aux + 15, x_aux + 45, y_aux + 42, y_aux + 50, cinco_5);	
	
	generate_rectangle rectSeis1   (x, y, x_aux + 15, x_aux + 25, y_aux + 10, y_aux + 50, seis_1);	
	generate_rectangle rectSeis2   (x, y, x_aux + 25, x_aux + 45, y_aux + 10, y_aux + 18, seis_2);	
	generate_rectangle rectSeis3   (x, y, x_aux + 25, x_aux + 45, y_aux + 26, y_aux + 34, seis_3);	
	generate_rectangle rectSeis4   (x, y, x_aux + 25, x_aux + 45, y_aux + 42, y_aux + 50, seis_4);	
	generate_rectangle rectSeis5   (x, y, x_aux + 35, x_aux + 45, y_aux + 34, y_aux + 42, seis_5);	

  	generate_rectangle rectSiete1  (x, y, x_aux + 15, x_aux + 45, y_aux + 10, y_aux + 20, siete_1);	
	generate_rectangle rectSiete2  (x, y, x_aux + 35, x_aux + 45, y_aux + 20, y_aux + 50, siete_2);	
  	 
	generate_rectangle rectOcho1   (x, y, x_aux + 15, x_aux + 25, y_aux + 10, y_aux + 50, ocho_1);	
	generate_rectangle rectOcho2   (x, y, x_aux + 35, x_aux + 45, y_aux + 10, y_aux + 50, ocho_2);	
	generate_rectangle rectOcho3   (x, y, x_aux + 25, x_aux + 35, y_aux + 10, y_aux + 18, ocho_3);	
	generate_rectangle rectOcho4   (x, y, x_aux + 25, x_aux + 35, y_aux + 26, y_aux + 34, ocho_4);	
	generate_rectangle rectOcho5   (x, y, x_aux + 25, x_aux + 35, y_aux + 42, y_aux + 50, ocho_5);	

	//generate_rectangle rectNueve1  (x, y, x_aux + 35, x_aux + 45, y_aux + 10, y_aux + 50, nueve_1);	
	//generate_rectangle rectNueve2  (x, y, x_aux + 15, x_aux + 25, y_aux + 10, y_aux + 34, nueve_2);	
	//generate_rectangle rectNueve3  (x, y, x_aux + 25, x_aux + 35, y_aux + 10, y_aux + 18, nueve_3);	
	//generate_rectangle rectNueve4  (x, y, x_aux + 25, x_aux + 35, y_aux + 26, y_aux + 34, nueve_4);	
	//generate_rectangle rectNueve5  (x, y, x_aux + 15, x_aux + 35, y_aux + 42, y_aux + 50, nueve_5);	

	generate_rectangle rectSelect  (x, y, x_aux + 10, x_aux + 50, y_aux + 52, y_aux + 56, select_1);	

	generate_rectangle rectBomba1  (x, y, x_aux + 15, x_aux + 45, y_aux + 26, y_aux + 34, bomba_1);
	generate_rectangle rectBomba2  (x, y, x_aux + 25, x_aux + 35, y_aux + 10, y_aux + 50, bomba_2);
	generate_rectangle rectBomba3  (x, y, x_aux + 20, x_aux + 40, y_aux + 20, y_aux + 40, bomba_3);

	generate_rectangle rectFlag1   (x, y, x_aux + 15, x_aux + 45, y_aux + 40, y_aux + 50, flag_1);	
	generate_rectangle rectFlag2   (x, y, x_aux + 25, x_aux + 35, y_aux + 25, y_aux + 40, flag_2);	
	generate_rectangle rectFlag3   (x, y, x_aux + 25, x_aux + 35, y_aux + 10, y_aux + 15, flag_3);
	generate_rectangle rectFlag4   (x, y, x_aux + 25, x_aux + 40, y_aux + 15, y_aux + 20, flag_4);	
	generate_rectangle rectFlag5   (x, y, x_aux + 25, x_aux + 45, y_aux + 20, y_aux + 25, flag_5);

  assign cero =   (sel == 4'b0000 & (cero_1   | cero_2    | cero_3  | cero_4               ))? 1 : 0;
  assign uno =    (sel == 4'b0001 & (uno_1    | uno_2     | uno_3                          ))? 1 : 0;
  assign dos =    (sel == 4'b0010 & (dos_1    | dos_2     | dos_3   | dos_4   | dos_5      ))? 1 : 0;
  assign tres =   (sel == 4'b0011 & (tres_1   | tres_2    | tres_3  | tres_4               ))? 1 : 0;
  assign cuatro = (sel == 4'b0100 & (cuatro_1 | cuatro_2  | cuatro_3                       ))? 1 : 0;
  assign cinco =  (sel == 4'b0101 & (cinco_1  | cinco_2   | cinco_3 | cinco_4 | cinco_5    ))? 1 : 0;
  assign seis =   (sel == 4'b0110 & (seis_1   | seis_2    | seis_3  | seis_4  | seis_5     ))? 1 : 0;
  assign siete =  (sel == 4'b0111 & (siete_1  | siete_2                                    ))? 1 : 0;
  assign ocho =   (sel == 4'b1000 & (ocho_1   | ocho_2    | ocho_3  | ocho_4  | ocho_5     ))? 1 : 0;
  //assign nueve =  (sel == 4'b1001 & (nueve_1  | nueve_2   | nueve_3 | nueve_4 | nueve_5  ))? 1 : 0;
  assign select = (sel == 4'b1001 & (select_1                                              ))? 1 : 0;
  assign bomba =  (sel == 4'b1010 & (bomba_1  | bomba_2   | bomba_3                        ))? 1 : 0;
  assign flag =   (sel == 4'b1011 & (flag_1   | flag_2    | flag_3  | flag_4  | flag_5     ))? 1 : 0;
 
  assign icon = (cero | uno | dos | tres | cuatro | cinco | seis | siete | ocho | select | bomba | flag) ? 1 : 0;

endmodule


