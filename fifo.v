module fifo #(parameter width=8,depth=16,add=4)
	(input wr,rd,clk,rst,
	input[width-1:0]din,
	output full,empty,
	output reg[width-1:0]dout);
reg[add-1:0]wa,ra;
reg[width-1:0]fmem[depth-1:0];
integer i;
always@(posedge clk)
begin
 if(rst)
  begin
   dout<=0;
   for(i=0;i<depth;i=i+1)
   fmem[i]<=0;
  end
else
begin
if(wr && ~full) fmem[wa]<=din;
if(rd && ~empty) dout<=fmem[ra];
end
end
// adress logic
always@(posedge clk)
begin
if (rst)
begin
  wa<=0; ra<=0;
end
else
begin
if(wr && ~full) wa<=wa+1;
if(rd && ~empty) ra<=ra+1;
end
end
//outs
assign full=((wa==15) && (ra==0)) ? 1'b1 : 1'b0;
assign empty= (wa==rd) ;
endmodule
