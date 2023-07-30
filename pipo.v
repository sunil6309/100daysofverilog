module pipo( clk,rst,a,q);
input clk,rst;
input[3:0]a;
output reg[3:0]q;
wire[3:0]a;
always@(posedge clk)
begin
if(rst)
q<=0;
else
begin
q<=a;
end
end
endmodule


