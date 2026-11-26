module tb_counter;

    logic clk = 0;
    logic rst_n = 0;
    logic [3:0] count;

    counter dut (
        .clk(clk),
        .rst_n(rst_n),
        .count(count)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("counter_waveform.vcd");
        $dumpvars;

        rst_n = 0;
        #12;
        rst_n = 1;

        repeat (20) @(posedge clk);

        if (count == 4'd8)
            $display("SMOKE TEST PASSED");
        else
            $display("SMOKE TEST FAILED: count = %0d", count);

        $finish;
    end

endmodule
