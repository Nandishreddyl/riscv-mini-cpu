module cpu_top_tb;

reg clk;
reg rst;

// ---------- DUT ----------
cpu_top uut (
    .clk(clk),
    .rst(rst)
);

// ---------- Clock Generation ----------
initial begin
    clk = 0;
    forever #5 clk = ~clk;   // 10ns clock
end

// ---------- Reset ----------
initial begin
    rst = 1;
    #20;
    rst = 0;                 // release reset
end

// ---------- Waveform Dump ----------
initial begin
    $dumpfile("cpu.vcd");
    $dumpvars(0, cpu_top_tb);
end

// ---------- DEBUG MONITOR (VERY IMPORTANT) ----------
initial begin
    $monitor(
      "T=%0t PC=%h INSTR=%h RS1=%h RS2=%h ALU=%h ALUCTRL=%b REGWRITE=%b",
      $time,
      uut.pc_out,
      uut.instruction,
      uut.read_data1,
      uut.read_data2,
      uut.alu_result,
      uut.alu_control,
      uut.reg_write
    );
end

// ---------- Stop Simulation ----------
initial begin
    #200;
    $finish;
end

endmodule