module piso_tb;
reg[3:0]in;
reg load,clk;
wire out;
piso DUT(.in(in),.load(load),.clk(clk),.out(out));

always
 begin
#5 clk=1'b0;
#5 clk=1'b1;
end


initial
begin
@(negedge clk)
in=4'b1001;
load=1;
@(negedge clk)
load=0;
end
endmodule



