module alu_tb;

reg [31:0] a;
reg [31:0] b;
reg [2:0] alu_control;
wire [31:0] result;

alu uut (
    .a(a),
    .b(b),
    .alu_control(alu_control),
    .result(result)
);

initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);

    a = 10;
    b = 5;

    alu_control = 3'b000; #10; // ADD
    alu_control = 3'b001; #10; // SUB
    alu_control = 3'b010; #10; // AND
    alu_control = 3'b011; #10; // OR

    #10 $finish;
end

endmodule