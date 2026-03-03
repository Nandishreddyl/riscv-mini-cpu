module control_unit(
    input [6:0] opcode,
    output reg reg_write,
    output reg mem_read,
    output reg mem_write,
    output reg [2:0] alu_control
);

always @(*) begin

    // default values
    reg_write = 0;
    mem_read = 0;
    mem_write = 0;
    alu_control = 3'b000;

    case(opcode)

        // R-type
        7'b0110011: begin
            reg_write = 1;
            alu_control = 3'b010;
        end

        // I-type (ADDI) ⭐ THIS IS YOUR INSTRUCTION
        7'b0010011: begin
            reg_write = 1;
            alu_control = 3'b010;
        end

        default: begin
            reg_write = 0;
        end

    endcase
end

endmodule