module pc (
    input clk,
    input rst,
    output reg [31:0] pc_out
);

always @(posedge clk or posedge rst) begin
    if (rst)
        pc_out <= 0;      // reset PC to 0
    else
        pc_out <= pc_out + 4; // next instruction
end

endmodule