module ucl4_tb();
reg clk,rst,load;
reg[3:0]d;
wire[3:0]count;
parameter cycle=10;

ucl4 DUT(clk,rst,load,d,count);

always
begin
#(cycle/2);
clk=1'b0;
#(cycle/2);
clk=1'b1;
end
task rstd();
begin
@(negedge clk);
rst=1'b1;
@(negedge clk);
rst=1'b0;
end
endtask

task inputs(input i,input[3:0]k);
begin
@(negedge clk);
load=i;
d=k;
end
endtask

initial
begin
rstd;
inputs(1'b1,4'd12);
inputs(1'b0,4'd12);

#200;
$finish;

end

initial 
begin
$monitor($time,"values of clk=%b,rst=%b,load=%b,d=%b,count=%b",clk,rst,load,d,count);
end
endmodule
