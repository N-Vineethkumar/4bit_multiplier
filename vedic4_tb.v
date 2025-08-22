// Testbench for Vedic Multiplier
module vedic4_tb;
    // Declare testbench variables
    reg [3:0] a, b;
    wire [7:0] s;
    integer i, j;

    // Instantiate the module under test
    vedic4 uut(
        .a(a),
        .b(b),
        .s(s)
    );

    // Initial stimulus
    initial begin
        // Initialize inputs
        a = 0;
        b = 0;
        
        // Display column headers
        $display("Time\tA\tB\tResult\tExpected");
        $display("----\t-\t-\t------\t--------");
        
        // Test specific cases
        #10 a = 4'd3; b = 4'd2;  // 3 x 2
        #10 a = 4'd5; b = 4'd4;  // 5 x 4
        #10 a = 4'd15; b = 4'd15;  // 15 x 15 (maximum)
        #10 a = 4'd0; b = 4'd8;  // 0 x 8
        #10 a = 4'd10; b = 4'd6;  // 10 x 6
        
        // Optional: Test all combinations (uncomment if needed)
        /*
        for(i = 0; i < 16; i = i + 1) begin
            for(j = 0; j < 16; j = j + 1) begin
                #10 a = i; b = j;
            end
        end
        */
        
        #10 $finish;
    end

    // Monitor changes
    always @(a or b) begin
        #1; // Small delay to allow multiplication to complete
        $display("%0d\t%0d\t%0d\t%0d\t%0d", $time, a, b, s, a*b);
        
        // Optional: Add verification
        if (s !== a*b) begin
            $display("ERROR: %0d x %0d = %0d (got %0d)", a, b, a*b, s);
        end
    end

endmodule
