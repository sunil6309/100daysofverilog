module spr(wr,en,d,add);
input wr,en;
input[3:0]add;
inout reg [7:0]d;
reg[7:0]mem[15:0];
always@(*)


if(wr && ~en) 
mem[add] =d;

assign d=(en&&~wr)?mem[add]:8'hzz;
endmodule

