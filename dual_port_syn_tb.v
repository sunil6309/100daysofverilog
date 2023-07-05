module dual_port_syn_tb();
parameter wi=8,dep=16,add=4;
		reg wr,rd,clk,rst;
		reg[add-1:0]wa,ra;
		reg[wi-1:0]din;
		wire[wi-1:0]dout;
		reg[wi-1:0]mem[dep-1:0];
dual_port_syn DUT (.wr(wr),.rd(rd),.clk(clk),.rst(rst),
		.wa(wa),.ra(ra),.din(din),.dout(dout));
always
begin 

#5;
clk=~clk;
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
@(negedge clk);
 rst=1'b1;
@(negedge clk);
 rst=1'b0;
end
endtask
task write(input[wi-1:0]a,input[add-1:0]b,w,r);
begin
@(negedge clk);
din=a;
wa=b;
wr=w;
rd=r;
end
endtask
task read(input[add-1:0]b,w,r);
begin
@(negedge clk);
ra=b;
wr=w;
rd=r;
end
endtask
initial
begin
clk=0;
reset;
 repeat(10)
 write({$random}%256,{$random}%16,1'b1,1'b0);

 repeat(10)
 read({$random}%16,1'b0,1'b1);

initialise;
fork
 begin
   repeat(5)
   write({$random}%256,{$random}%16,1'b1,1'b1);
  end
 begin
    repeat(5)
    read({$random}%16,1'b1,1'b1);
 end
join
#100;
end
endmodule
