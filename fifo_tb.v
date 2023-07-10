module fifo_tb();
parameter width=8,depth=16,add=4;
reg wr,rd,clk,rst;
reg [width-1:0]din;
wire full,empty;
wire[width-1:0]dout;
reg[add-1:0]wa,ra;
reg[width-1:0]fmem[depth-1:0];
fifo DUT(.wr(wr),.rd(rd),.clk(clk),.rst(rst),.din(din),.full(full),.empty(empty),.dout(dout));

always#5clk=~clk;

task initialize;
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
task write(input[width-1:0]dinp,input w,r);
begin
@(negedge clk);
din=dinp;
wr=w;
rd=r;
end
endtask
task read(input w,r);
begin
wr=w;
rd=w;
end
endtask
initial
begin
clk=0;
reset;
repeat(16)
write({$random}%256,1'b1,1'b0);
repeat(16)
read(1'b0,1'b1);
initialize;
#10
fork
begin
repeat(8)
write({$random}%256,1'b1,1'b1);
end
begin
repeat(8)
read(1'b1,1'b1);
end
join
end
endmodule


