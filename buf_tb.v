module bufi_tb;
reg en,a;
wire b;
integer i;
bufi DUT(.en(en),.a(a),.b(b));

initial
begin
for(i=0;i<4;i=i+1)
 begin
  {en,a}=i;
  #10;
  end
end
endmodule
