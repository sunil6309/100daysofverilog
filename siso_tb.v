module siso_tb(); 
reg clk; 
reg rst; 
reg s_in; 
wire s_out; 
siso DUT(clk,rst,s_in,s_out); 
always 
begin 
#5 
clk = ~clk; 
end 
task reset(); 
begin 
rst = 1'b1; 
#10; 
rst = 1'b0; 
end 
endtask 
task sin_s(input i); 
begin  
@(negedge clk) 
s_in = i;
end 
endtask 
initial 
begin 
clk=0; 
reset; 
sin_s(0); 
reset; 
sin_s(1); 
sin_s(0); 
sin_s(1); 
sin_s(1); 
sin_s(1); 
sin_s(0); 
sin_s(0); 
sin_s(1); 
sin_s(1); 
#10; 
end
endmodule
