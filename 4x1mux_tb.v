module mux4x1_tb;
reg a;
reg b;
reg[0:3]z;
wire y;
integer i;
mux4x1 DUT(.a(a),.b(b),.z(z),.y(y));

initial 
begin
 for(i=0;i<64;i=i+1)
 begin
  {a,b,z}=i;
  #10;
  end
end
endmodule
