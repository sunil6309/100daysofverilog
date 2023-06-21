module muxbeh_tb();
reg [0:1]sel;
reg [0:3]a;
wire y;
integer m,n;
muxbeh DUT(sel,a,y);
task initialize;
 begin
   {sel,a}=0;
 end
endtask
task inputs(input[0:3]j);
 begin
   {a}=j;
 end
endtask
task selective(input[0:1]i);
 begin
   {sel}=i;
 end
endtask
initial
 begin 
   initialize;
    for(m=0;m<4;m=m+1)
      begin
        selective(m);
          for(n=0;n<16;n=n+1)
           begin
            inputs(n);
             #10;
           end
      end
 end
endmodule


