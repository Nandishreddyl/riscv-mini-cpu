module register_file(
    input clk,
    input rst,              // ⭐ MUST EXIST
    input reg_write,
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    input [31:0] write_data,
    output [31:0] read_data1,
    output [31:0] read_data2
);

reg [31:0] regs[0:31];
integer i;

// ---------- RESET + WRITE ----------
always @(posedge clk or posedge rst) begin
    if (rst) begin
        for(i=0;i<32;i=i+1)
            regs[i] <= 32'b0;   // ⭐ CRITICAL FIX
    end
    else if(reg_write && rd!=0) begin
        regs[rd] <= write_data;
    end
end

// ---------- READ ----------
assign read_data1 = regs[rs1];
assign read_data2 = regs[rs2];

endmodule