module demux_tb;
reg[1:0]s;
reg a;
wire [3:0]d;
integer i;
demux DUT(s,a,d);
initial
begin
a=1;
   for(i=0;i<4;i=i+1)
       begin
        s=i;
        #10;
       end
end
endmodule


