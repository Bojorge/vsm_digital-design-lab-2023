
//Decodificador de 4 bits binario a hexadecimal/BDC
module problema1(
    input [3:0] binary_input,
    output [6:0] display //secuecia del bits del display (anodo comun)
);

wire a, b, c, d, e, f, g; //segmentos del display
wire I0, I1, I2, I3; //bits del input 

assign I3 = binary_input[0];
assign I2 = binary_input[1];
assign I1 = binary_input[2];
assign I0 = binary_input[3];


assign display = {g, f, e, d, c, b, a};

assign g = (~I0 & ~I1 & ~I2) | (~I0 & I1 & I2 & I3) | (I0 & I1 & ~I2 & ~I3);
assign f = (~I0 & ~I1 & I3) | (~I0 & ~I1 & I2) | (~I0 & I2 & I3) | (I0 & I1 & ~I2 & I3);
assign e = (~I0 & I3) | (~I0 & I1 & ~I2) | (~I1 & ~I2 & I3);
assign d = (I1 & I2 & I3) | (~I0 & ~I1 & ~I2 & I3) | (~I0 & I1 & ~I2 & ~I3) | (I0 & ~I1 & I2 & ~I3);
assign c = (I0 & I1 & ~I3) | (I0 & I1 & I2) | (~I0 & ~I1 & I2 & ~I3);
assign b = (I1 & I2 & ~I3) | (I0 & I2 & I3) | (I0 & I1 & ~I3) | (~I0 & I1 & ~I2 & I3);
assign a = (~I0 & ~I1 & ~I2 & I3) | (~I0 & I1 & ~I2 & ~I3) | (I0 & ~I1 & I2 & I3) | (I0 & I1 & ~I2 & I3);    

endmodule
