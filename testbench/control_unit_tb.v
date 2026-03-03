module control_unit_tb;

reg [6:0] opcode;
wire reg_write;
wire mem_read;
wire mem_write;
wire [2:0] alu_control;

control_unit uut (
    .opcode(opcode),
    .reg_write(reg_write),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .alu_control(alu_control)
);

initial begin
    $dumpfile("control.vcd");
    $dumpvars(0, control_unit_tb);

    opcode = 7'b0110011; #10; // R-type
    opcode = 7'b0000011; #10; // LW
    opcode = 7'b0100011; #10; // SW

    #10 $finish;
end

endmodule