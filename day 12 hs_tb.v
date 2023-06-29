module hs_tb();
reg a,b;
wire diff,borr;
integer i;
hs DUT(a,b,diff,borr);
initial
begin

for(i=0;i<4;i=i+1)
begin
{a,b}=i;
#10;
end
end
endmodule

