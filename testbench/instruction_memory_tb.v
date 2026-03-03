module instruction_memory_tb;

reg [31:0] addr;
wire [31:0] instruction;

instruction_memory uut (
    .addr(addr),
    .instruction(instruction)
);

initial begin
    $dumpfile("imem.vcd");
    $dumpvars(0, instruction_memory_tb);

    addr = 0;
    #10 addr = 4;
    #10 addr = 8;
    #10 addr = 12;

    #20 $finish;
end

endmodule