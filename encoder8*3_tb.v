// Code your testbench here
// or browse Examples
module tb;
  reg en;
  reg[7:0]in;
  wire[2:0]out;
  encoder DUT(en,in,out);
  initial begin
  $dumpfile("dump.vcd"); 
    $dumpvars(0);
  end
  initial
    begin
      en=0;
      #5 en=1;
      #10 in=8'h0_1;
      #10 in=8'h0_2;
      #10 in=8'h0_4;
      #10 in=8'h0_8;
      #10 in=8'h1_0;
      #10 in=8'h2_0;
      #10 in=8'h4_0;
      #10 in=8'h8_4;
      #40 $finish;
    end
endmodule
      
