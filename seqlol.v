module seqlol(input din,rst,clk,
		output dout);
parameter idle=2'b00,
	state1=2'b01,
	state2=2'b10,
	state3=2'b11;
reg[1:0]state,ns;
always@(posedge clk)

begin
if(rst==1)
state<=idle;
else
state<=ns;
end

always@(din or state)
begin
case(state)
idle :  if(din==1) ns=state1;
	else ns=idle;
state1: if(din==0) ns=state2;
	else ns=state1;
state2: if(din==1) ns=state3;
	else ns=idle;
state3: if(din==1) ns=state1;
	else ns=state2;
default ns=idle;
endcase
end
assign dout= (state==state3)?1'b1:1'b0;
endmodule


