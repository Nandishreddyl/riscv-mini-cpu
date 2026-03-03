module cpu_top (
    input clk,
    input rst
);

// -------- wires ----------
wire [31:0] pc_out;
wire [31:0] instruction;

wire reg_write;
wire mem_read;
wire mem_write;
wire [2:0] alu_control;

wire [31:0] read_data1, read_data2;
wire [31:0] alu_result;

wire [31:0] if_pc;
wire [31:0] if_instr;

wire [31:0] id_pc;
wire [31:0] id_instr;

// ---------- IF stage ----------
assign if_pc    = pc_out;
assign if_instr = instruction;

// -------- IF/ID Pipeline Register ----------
if_id_reg ifid (
    .clk(clk),
    .rst(rst),
    .pc_in(if_pc),
    .instr_in(if_instr),
    .pc_out(id_pc),
    .instr_out(id_instr)
);

// -------- PC ----------
pc pc_inst (
    .clk(clk),
    .rst(rst),
    .pc_out(pc_out)
);

// -------- Instruction Memory ----------
instruction_memory imem (
    .addr(pc_out),      // PC fetch
    .instruction(instruction)
);

// -------- Control Unit ----------
control_unit cu (
    .opcode(id_instr[6:0]),
    .reg_write(reg_write),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .alu_control(alu_control)
);

// -------- Register File ----------
register_file rf (
    .clk(clk),
    .rst(rst),                     // ⭐ FIX 1 (VERY IMPORTANT)
    .reg_write(reg_write),
    .rs1(id_instr[19:15]),
    .rs2(id_instr[24:20]),
    .rd(id_instr[11:7]),
    .write_data(alu_result),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

// -------- ALU ----------
alu alu_inst (
    .a(read_data1),
    .b(read_data2),
    .alu_control(alu_control),
    .result(alu_result)
);

endmodule