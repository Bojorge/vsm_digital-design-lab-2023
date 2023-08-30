module problema1_tb;

  //Input 
  reg [3:0] binary_input;
  
  //Output
  wire [6:0] display;

  //Instancia del modulo 
  problema1 uut (
    .binary_input(binary_input),
    .display(display)
  );

  initial begin

    $dumpfile("problema1_tb.vcd");
    $dumpvars(0, problema1_tb);

    binary_input = 4'b0010;
    #10 $display("Input: %b, Display: %b", binary_input, display);

    binary_input = 4'b1100;
    #10 $display("Input: %b, Display: %b", binary_input, display);

    binary_input = 4'b0000;
    #10 $display("Input: %b, Display: %b", binary_input, display);

    $finish; 
  end
  
 endmodule