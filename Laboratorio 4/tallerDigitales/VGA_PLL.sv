module VGA_PLL (
    input wire clk_in,       // Reloj de entrada de 50 MHz
    output wire clk_out      // Salida del reloj VGA de 25.175 MHz
);

    
    wire [6:0] clk_out_phase;

    altpll vga_pll (
        .inclk0(clk_in),
        .c0(clk_out),
        .locked(pll_locked),
        .phasecounterselect("BYPASS"),
        .counter_arst("COUNTER_BYPASS"),
        .areset(1'b0)
    );

endmodule