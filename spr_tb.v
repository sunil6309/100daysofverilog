module spr_tb();
reg wr,en;
reg[3:0]add;
wire[7:0]d;
reg[3:0]tempd;
integer l,a;
spr DUT(wr,en,d,add);
assign d=(wr && ~en) ?tempd:8'hzz;
task initialise;
begin
wr=0;
en=0;
tempd=0;
end
endtask
task inputs(input[7:0]di,input[3:0]ad);
begin
tempd=di;
add=ad;
end
endtask
task write;
begin
wr=1;
en=0;
end
endtask
task read;
 begin
 wr=0;
 en=1;
end
endtask
initial
begin
initialise;
#10;
write;
 for(l=0;l<16;l=l+1)
   begin
      inputs(l,l);
      #10;
    end
initialise;
#10;
read;
for(a=0;a<16;a=a+1)
   begin
      inputs(a,a);
      #10;
    end
end
initial 
begin 
$fsdbDumpvars(0,spr_tb); 
end
endmodule
