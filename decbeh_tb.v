module decbeh_tb();
reg[2:0]a;
reg en;
wire[7:0]d;
integer m;
decbeh DUT(a,en,d);
task initialize;
   begin
	{a,en}=0;
   end
 endtask
 task inputs(input[2:0]i);
  begin
        {a}=i;
  end
 endtask
initial
begin
initialize;
  for(m=0;m<8;m=m+1)
  begin
    en =1'b1;
    inputs(m);
    #10;
   end
end
initial begin
  $monitor($time,"a=%b,en=%b,d=%b",a,en,d);
end
endmodule 
