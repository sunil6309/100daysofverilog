module vmchin_ml(input rs1,rs2,clk,rst,
		output reg pr,re);
parameter s0=2'b00,
	s1=2'b01,
	s2=2'b10;
reg[1:0]state,ns;
always@(posedge clk)
begin
if(rst)
state<=s0;
else
state<=ns;
end
  always@(*)
begin
ns=s0;
  case(state)
s0: if(rs1)
     ns=s1;
    else if(rs2)
     ns=s2;
     else 
      ns=s0;
s1:if(rs1)
	ns=s2;
   else if(rs2)
	ns=s0;
   else ns=s1;
s2:if((rs1 )||( rs2))
    ns=s0;
   else
    ns=s2;
endcase
end
always@(posedge clk)
begin
pr<=0;re<=0;
case(state)
s1: if(rs2)
    pr<=1;
s2: if(rs1)
     pr<=1;
    else if(rs2)
     begin
      pr<=1;
      re<=1;
      end
endcase
end
endmodule
     
