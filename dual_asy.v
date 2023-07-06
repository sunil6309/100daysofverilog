module dual_asy #(parameter wi=8,dep=16,add=4)
		(input wr,rd,wr_clk,rd_clk,rst,
		input[add-1:0]wa,ra,
		input[wi-1:0]din,
		output reg[wi-1:0]dout);
		reg[wi-1:0]mem[dep-1:0];
	       integer i;
always@(posedge rd_clk,posedge rst)
begin

if(rst)
   begin
  dout<=0;
    for(i=0;i<dep;i=i+1)
        mem[i]<=0;
     end
else

 if (~wr && rd) 
 dout<=mem[ra];

end

always@(posedge wr_clk)

  if(wr && ~rd)  
  mem[wa]<=din;
 

endmodule

