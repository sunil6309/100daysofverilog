module df(input clk,rst,d,
	output reg q,
	output qb);
always @ (posedge clk)
begin 
if (rst)
q<=4'b0;
else
q<=d;
end
assign qb=~q;
endmodule
