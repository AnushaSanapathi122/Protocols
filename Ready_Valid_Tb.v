module valid_ready_tb;

reg clk;
reg rst;
top_moduler uut (
    .clk(clk),
    .rst(rst)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    #20 rst = 0;
    #200 $finish;
end

endmodule
