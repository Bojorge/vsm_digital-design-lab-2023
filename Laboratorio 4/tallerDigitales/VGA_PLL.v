module VGA_PLL (
    input wire clk_in,       // Reloj de entrada de 50 MHz
    output wire clk_out      // Salida del reloj VGA de 25.175 MHz
);

    // Instanciar el IP Core del PLL (esto puede variar según tu FPGA)
    // Aquí se muestra un ejemplo para un dispositivo Intel (anteriormente Altera)
    wire pll_locked;
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
