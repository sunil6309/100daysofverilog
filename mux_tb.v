module mux_tb;
reg a,d1,d2;
wire y;
integer i;
mux DUT(.a(a),.d1(d1),.d2(d2),.y(y));
initial 
begin

 for(i=0;i<8;i=i+1)
 begin
 {d1,d2,a}=i;
 #10;
 end
end 
 endmodule
 

