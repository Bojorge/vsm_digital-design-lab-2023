module Display_tb;

    // Inputs
    logic [2:0] binary_value;

    // Outputs
    logic [6:0] segment;

    // Instantiate the module to be tested
    Display display_inst (
        .binary_value(binary_value),
        .segment(segment)
    );

    // Simulation control
    initial begin
        $display("Testing Display Module");

        // Test with different binary values
        for (int i = 0; i < 8; i++) begin
            binary_value = i;
            #10;
            $display("Binary Value: %b, Segment: %b", binary_value, segment);
        end
		  
    end
endmodule
