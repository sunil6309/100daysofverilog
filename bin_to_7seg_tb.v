module bin_to_7seg_tb;
reg[3:0] in;
wire[7:0]out,dot;
integer j;
bin_to_7seg sun(in,out,dot);

task stim1;
begin
in<=0;
for(j=0;j<16;j=j+1)
begin
in=j;
#10;
$display("in is %d",in);
end
end
endtask
initial
begin
stim1;
#100 $finish;
end
initial
begin
$monitor("input =%d,output=%b",in,out);
end
endmodule
