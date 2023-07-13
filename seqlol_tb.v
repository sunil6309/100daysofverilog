module seqlol_tb();
parameter idle=2'b00,
	state1=2'b01,
	state2=2'b10,
	state3=2'b11;
reg[1:0]state,ns;
reg din,rst,clk;
wire dout;
seqlol DUT(din,rst,clk,dout);
always#5clk=~clk;
task reset;
begin
rst=1'b1;
#10
rst=1'b0;
end
endtask
always@(state or dout)
     begin
        if(state==state3 && dout==1)
	  $display("output =%b",state);
      end
initial
begin
clk=0;
din=0;
reset;
#5 din=0;
#5 din=1;
#5 din=0;
#5 din=1;
#5 din=0;
#5 din=1;
#5 din=1;
#5 din=0;
#5 din=0;
#5 din=1;
#5 din=1;
#10;
end
endmodule
