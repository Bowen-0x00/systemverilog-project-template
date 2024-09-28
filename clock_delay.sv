module clock_delay();

reg clk;
reg a, b, z;
initial begin
  clk <= 0;
  forever #10 clk <= !clk;
end

initial begin
    $dumpfile("build/clock_delay.vcd");
    $dumpvars(1, clock_delay);
end

sequence Sab;
a ##2 b;
endsequence

property ab;
    @(posedge clk) z |-> Sab;
endproperty

baseP: assert property (ab) abPASS; else abFail;

task abPASS;
    $display($stime,,,"\t property ab PASS");
endtask

task abFail;
    $display($stime,,,"\t property ab FAIL");
endtask
initial begin
    a <= 0;
    b <= 0;
    z <= 1;
    @(posedge clk);
    a <= 1;
    b <= 1;
    @(posedge clk);
    a <= 0;
    b <= 1;
    @(posedge clk);
    a <= 0;
    b <= 0;
    @(posedge clk);
    a <= 1;
    b <= 0;
    @(posedge clk);
    a <= 0;
    b <= 1;
    @(posedge clk);
    a <= 0;
    b <= 1;
    @(posedge clk);
    z <= 0;
    repeat(10)
    @(posedge clk);
    $finish;
end

endmodule