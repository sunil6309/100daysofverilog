module df_tb();
reg clk,rst,d;
wire q,qb;
df DUT(clk,rst,d,q,qb);
always
 begin
  #5;
  clk=1'b0;
  #5;
  clk=~clk;
 end
task rstd();
 begin
  rst=1'b1;
  #10; 
  rst=1'b0;
 end 
endtask
task din(input i);
begin
@(posedge clk)
{d}=i;
#10;
end
endtask
initial
begin
 rstd;
 din(1'b0);
 din(1'b1);
 rstd;
 din(1'b1);
 din(1'b0);
 din(1'b0);


end
initial
begin
$monitor($time,"clk=%b,reset=%b,data=%b,q=%b,qb=%b",clk,rst,d,q,qb);
end
endmodule
