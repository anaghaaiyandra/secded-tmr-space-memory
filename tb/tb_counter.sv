`timescale 1ns/1ps

module tb_counter;

    logic clk = 1'b0;
    logic rst_n = 1'b0;
    logic [3:0] count;

    counter dut (
        .clk(clk),
        .rst_n(rst_n),
        .count(count)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("counter_waveform.vcd");
        $dumpvars(0, tb_counter);

        #12 rst_n = 1'b1;

        // Give reset and the first rising edges time to settle.
        @(negedge clk);
        if (count != 4'b0000)
            $fatal(1, "Reset failure: count = %0d", count);

        repeat (20) @(posedge clk);

        if (count !== 4'd8)
            $fatal(1, "SMOKE TEST FAILED: count = %0d, expected 8", count);

        $display("SMOKE TEST PASSED");
        $finish;
    end

    initial begin
        #1ms;
        $fatal(1, "SIMULATION TIMEOUT");
    end

endmodule
