`timescale 1ns/1ps

module tb_counter;

    localparam time CLK_PERIOD = 10ns;
    localparam time TEST_TIMEOUT = 1ms;

    logic clk = 1'b0;
    logic rst_n = 1'b0;
    logic [3:0] count;

    counter dut (
        .clk   (clk),
        .rst_n (rst_n),
        .count (count)
    );

    always #(CLK_PERIOD / 2) clk = ~clk;

    task automatic check_count(
        input logic [3:0] expected,
        input string description
    );
        begin
            #1;

            if (count !== expected) begin
                $fatal(
                    1,
                    "FAIL: %s: count=%0b (%0d), expected=%0b (%0d)",
                    description,
                    count,
                    count,
                    expected,
                    expected
                );
            end
        end
    endtask

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_counter);

        // Reset is asserted initially. Verify it after clock edges.
        repeat (2) begin
            @(posedge clk);
            check_count(4'd0, "Counter remains reset");
        end

        // Hold reset for a few more edges.
        repeat (3) begin
            @(posedge clk);
            check_count(4'd0, "Reset hold");
        end

        // Release reset away from a rising edge.
        @(negedge clk);
        rst_n = 1'b1;

        // Verify the first post-reset value.
        @(posedge clk);
        check_count(4'd1, "First count after reset");

        // Verify every count through 15.
        for (int expected = 2; expected <= 15; expected++) begin
            @(posedge clk);
            check_count(expected[3:0], "Sequential count");
        end

        // Verify wraparound from 15 to 0.
        @(posedge clk);
        check_count(4'd0, "Wraparound");

        // Verify counting resumes after wraparound.
        @(posedge clk);
        check_count(4'd1, "Count after wraparound");

        @(posedge clk);
        check_count(4'd2, "Count after wraparound");

        @(posedge clk);
        check_count(4'd3, "Count after wraparound");

        // Reassert reset asynchronously.
        #2;
        rst_n = 1'b0;
        #1;
        check_count(4'd0, "Second asynchronous reset");

        // Release reset and run a simple 20-edge smoke test.
        @(negedge clk);
        rst_n = 1'b1;

        repeat (20) begin
            @(posedge clk);
            #1;
        end

        if (count !== 4'd4) begin
            $fatal(
                1,
                "SMOKE TEST FAILED: count=%0b (%0d), expected=0100 (4)",
                count,
                count
            );
        end

        $display("SMOKE TEST PASSED");
        $finish;
    end

    initial begin
        #(TEST_TIMEOUT);
        $fatal(1, "SIMULATION TIMEOUT after %0t", TEST_TIMEOUT);
    end

endmodule
