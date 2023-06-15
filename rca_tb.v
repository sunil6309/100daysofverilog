module rca_tb();
reg[0:3] a,b;
reg c;
wire[0:3] s;
wire ca;

rca DUT(a,b,c,s,ca);
initial 
begin
 a=4'h5;
 b=4'h5;
 c=0;
 #10;
 a=4'h4;
 b=4'h6;
 c=1;
 end

endmodule