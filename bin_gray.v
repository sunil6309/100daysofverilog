module bin_gray#(parameter n=4)(input [n-1:0]a,
		output reg[n-1:0]out);
integer i;
always@(*)
begin
out[n-1]=a[n-1];
for(i=n-2;i>=0;i=i-1)
begin
out[i]=a[i]^a[i+1];
end
end
endmodule

