module Top (
    output reg hsync,    // HSYNC (to VGA connector)
    output reg vsync,    // VSYNC (to VGA connector)
    output [3:0] red,     // RED (to resistor DAC VGA connector)
    output [3:0] green,   // GREEN (to resistor DAC to VGA connector)
    output [3:0] blue     // BLUE (to resistor DAC to VGA connector)
);

    wire clk;
    wire blank;

    // Instantiate VGA controller
    VGA_Controller vga_controller (
        .hsync(hsync),
        .vsync(vsync),
        .clk(clk),
        .blank(blank)
    );

    // Instantiate white screen generator
    White_Screen white_screen (
        .red(red),
        .green(green),
        .blue(blue)
    );

endmodule

