module siso(input clk, 
input rst, 
input s_in, 
output s_out); 
reg [3:0]q; 
assign s_out = q[0]; 
always@(posedge clk) 
begin 
if(rst) 
q <= 0; 
else 
q <= {s_in, q[3:1]}; 
end 
endmodule 
