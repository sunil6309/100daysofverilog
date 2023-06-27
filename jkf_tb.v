module jkf_tb();
reg j,k,clk,rst;
wire q,qb;
jkf DUT(j,k,clk,rst,q,qb);
always
begin
#5
clk=1'b0;
#5
clk=~clk;
end
task rstd();
 begin
 rst=1'b1;
 #10;
 rst=1'b0;
 end
endtask
task inputs(input i,l);
 begin
 {j,k}={i,l};
 #10;
 end
endtask
initial
begin
rstd;
inputs(1'b0,1'b0);
inputs(1'b0,1'b1);
inputs(1'b1,1'b0);
inputs(1'b1,1'b1);
rstd;
inputs(1'b1,1'b1);
inputs(1'b1,1'b0);
inputs(1'b0,1'b1);
inputs(1'b1,1'b0);
inputs(1'b0,1'b0);
inputs(1'b0,1'b1);
inputs(1'b1,1'b0);
inputs(1'b1,1'b1);
#10;
end
initial
begin
$monitor ($time,"values of clk=%b,rst=%b,j=%b,k=%b,q=%b,qb=%b",clk,rst,j,k,q,qb);
end
endmodule
