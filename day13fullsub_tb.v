module fulsub_tb();
reg a,b,c;
wire diff,borr;
integer i;
fulsub DUT(a,b,c,diff,borr);
initial
begin

for(i=0;i<8;i=i+1)
begin
{a,b,c}=i;
$display("values is a=%b,b=%b,c=%b,diff=%b,borr=%b",a,b,c,diff,borr);
#10;
end
end
endmodule

