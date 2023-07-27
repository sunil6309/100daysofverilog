module vmchin_ml_tb();

reg rs1,rs2,clk,rst;
wire pr,re;

vmchin_ml DUT(rs1,rs2,clk,rst,pr,re);

parameter cycle=10;

always
begin
#(cycle/2)
clk=1'b0;
#(cycle/2)
clk=~clk;
end

task RESET;
begin
rst=1'b1;
#10;
rst=1'b0;
end
endtask

task stimulus(input a,b);
begin
@(negedge clk)
rs1=a;
rs2=b;
end
endtask

initial
begin
RESET;
stimulus(1'b0,1'b0);
stimulus(1'b0,1'b1);
stimulus(1'b0,1'b1);
stimulus(1'b1,1'b0);
stimulus(1'b1,1'b1);

#70 $finish;
end

initial begin
$monitor("Input 1rs=%b,2rs=%b, Output product=%b,change=%b",rs1,rs2,pr,re);
end

endmodule


