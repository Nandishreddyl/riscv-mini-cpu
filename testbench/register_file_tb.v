module register_file_tb;

reg clk;
reg reg_write;
reg [4:0] rs1, rs2, rd;
reg [31:0] write_data;
wire [31:0] read_data1, read_data2;

register_file uut (
    .clk(clk),
    .reg_write(reg_write),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .write_data(write_data),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

// clock generation
always #5 clk = ~clk;

initial begin
    $dumpfile("regfile.vcd");
    $dumpvars(0, register_file_tb);

    clk = 0;
    reg_write = 0;

    // write data into register 1
    #10;
    reg_write = 1;
    rd = 5'd1;
    write_data = 32'd25;

    #10;
    reg_write = 0;
    rs1 = 5'd1;
    rs2 = 5'd0;

    #30 $finish;
end

endmodule