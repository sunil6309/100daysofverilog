module bin_gray_tb();
parameter n=4;
reg [n-1:0]a;
wire [n-1:0]out;
integer i;
bin_gray DUT(.a(a),.out(out));

initial
begin
for(i=0;i<15;i=i+1)
begin
a=i;#10;
end
end
endmodule
