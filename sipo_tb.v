module tb;
  reg clk,clr,a;
  wire[3:0]out;
  sipo DUT(clk,clr,a,out);
  always #5 clk=~clk;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
  initial
    begin
      clk=0;
      clr=1;
      #5 clr=1'b0;
      #10 a=1'b1;
      #10 a=1'b0;
      #10 a=1'b1;
      #10 a=1'b0;
      #100 $finish;
    end

endmodule
