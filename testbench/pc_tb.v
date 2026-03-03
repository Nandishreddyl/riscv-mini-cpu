module pc_tb;

reg clk;
reg rst;
wire [31:0] pc_out;

pc uut (
    .clk(clk),
    .rst(rst),
    .pc_out(pc_out)
);

// clock generation
always #5 clk = ~clk;

initial begin
    $dumpfile("pc.vcd");
    $dumpvars(0, pc_tb);

    clk = 0;
    rst = 1;

    #10 rst = 0;   // release reset

    #100 $finish;
end

endmodule