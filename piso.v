module piso(in,load,clk,out);
input[3:0]in;
input load,clk;
output reg out;
reg[3:0]q;
always@(posedge clk)
begin
if(load)
q<=in;
else
begin
out<=q[3];
q<={q[2:0],1'b0};
end
end
endmodule




