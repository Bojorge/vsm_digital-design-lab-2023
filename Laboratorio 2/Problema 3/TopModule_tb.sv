module TopModule_tb;
    // Inputs
    logic clk;
    logic reset;

    // Outputs
    logic [6:0] display_segment;

	 
    // Instantiate the module to be tested
    TopModule top_module (
        .clk(clk),
        .reset(reset),
        .display_segment(display_segment)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    
    initial begin
        reset = 1;
        #10 reset = 0;
        #100 reset = 1; 
        #100 $finish;   
    end

    
    initial begin
        #20;

        // Simulate for a while
        for (int i = 15; i >= 0; i--) begin
            #10; 
            $display("Time: %0t - Counter Value: %d, Display Segment: %b", $time, i, display_segment);
        end

    end
endmodule
