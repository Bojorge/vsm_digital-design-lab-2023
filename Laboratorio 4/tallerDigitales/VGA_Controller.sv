module VGA_Controller (
    output reg hsync,    // HSYNC (to VGA connector)
    output reg vsync,    // VSYNC (to VGA connector)
    output wire clk,      // CLK to VGA connector
    output wire blank     // BLANK to VGA connector
);

    // Horizontal parameters (measured in clock cycles)
    parameter [9:0] H_ACTIVE  =  10'd640 ;
    parameter [9:0] H_FRONT   =  10'd10 ;
    parameter [9:0] H_PULSE   =  10'd95 ;
    parameter [9:0] H_BACK    =  10'd47 ;

    // Vertical parameters (measured in lines)
    parameter [9:0] V_ACTIVE   =  10'd480 ;
    parameter [9:0] V_FRONT    =  10'd10 ;
    parameter [9:0] V_PULSE =  10'd1 ;
    parameter [9:0] V_BACK  =  10'd32 ;

    // Internal clock generation for VGA timing (60 Hz)
    reg [25:0] counter;
    reg clock;

  always @(posedge counter) begin
    // Toggle clock signal every half frame (para 60 Hz)
    if (counter == (50_000_000 / 60 / 2) - 1) begin
        clock <= ~clock;
        counter <= 0;
    end else begin
        counter <= counter + 1;
    end
end
    // State machine for VGA timing
    reg [9:0] h_counter;
    reg [9:0] v_counter;

    always @(posedge clock) begin
        if (h_counter == H_ACTIVE) begin
            if (v_counter == V_ACTIVE) begin
                hsync <= 1'b1;
                vsync <= 1'b1;
            end else begin
                hsync <= 1'b0;
                vsync <= 1'b0;
            end
        end else begin
            hsync <= 1'b0;
            vsync <= 1'b0;
        end

        if (h_counter == H_BACK) begin
            h_counter <= 10'd0;
            if (v_counter == V_BACK) begin
                v_counter <= 10'd0;
            end else begin
                v_counter <= v_counter + 10'd1;
            end
        end else begin
            h_counter <= h_counter + 10'd1;
        end
    end

    // Assign output values - to VGA connector
    assign clk = clock;
    assign blank = ~(hsync & vsync);

endmodule
