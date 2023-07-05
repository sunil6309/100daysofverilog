module dual_port_syn #(parameter wi=8,dep=16,add=4)
		(input wr,rd,clk,rst,
		input[add-1:0]wa,ra,
		input[wi-1:0]din,
		output reg[wi-1:0]dout);
		reg[wi-1:0]mem[dep-1:0];
	       integer i;
always@(posedge clk)
begin

if(rst)
begin
  dout<=0;
    for(i=0;i<dep;i=i+1)
        mem[i]<=0;
end
 else
 begin
  if(wr && ~rd)  mem[wa]<=din;
  if (~wr && rd)  dout<=mem[ra];
 end
end
endmodule


