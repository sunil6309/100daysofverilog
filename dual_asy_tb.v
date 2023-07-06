module dual_asyn_tb();
parameter wi=8,dep=16,add=4;
		reg wr,rd,wr_clk,rd_clk,rst;
		reg[add-1:0]wa,ra;
		reg[wi-1:0]din;
		wire[wi-1:0]dout;
		reg[wi-1:0]mem[dep-1:0];
dual_asy DUT (.wr(wr),.rd(rd),.wr_clk(wr_clk),.rd_clk(rd_clk),.rst(rst),
		.wa(wa),.ra(ra),.din(din),.dout(dout));
always
begin 
#15;
rd_clk=~rd_clk;
end
always
begin 
#5;
wr_clk=~wr_clk;
end
task initialise;
begin
wr=0;
rd=0;
din=0;
end
endtask
task reset;
begin

 rst=1'b1;
#10;
 rst=1'b0;
end
endtask
task write(input[wi-1:0]a,input[add-1:0]b,w,r);
begin
@(negedge wr_clk);
din=a;
wa=b;
wr=w;
rd=r;
end
endtask
task read(input[add-1:0]b,w,r);
begin
@(negedge rd_clk);
ra=b;
wr=w;
rd=r;
end
endtask
task write_rd(input[wi-1:0]a,input[add-1:0]b,input[add-1:0]c,w,r);
begin
@(negedge wr_clk);
din=a;
wa=b;
wr=w;
rd=r;
@(negedge rd_clk);
ra=c;
wr=w;
rd=r;
end
endtask
initial
begin
rd_clk=0;
wr_clk=0;
reset;
 repeat(10)
 write({$random}%256,{$random}%16,1'b1,1'b0);

 repeat(10)
 read({$random}%16,1'b0,1'b1);

   repeat(10)
   write_rd({$random}%256,{$random}%16,{$random}%16,1'b1,1'b1);
  
#100;
end
endmodule
