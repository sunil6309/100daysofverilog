module rca(input[0:3]a,
	input[0:3]b,
	input c,
	output[0:3]s,
	output ca);
wire ca1,ca2,ca3;
fa fa1(.a(a[0]),.b(b[0]),.c(c),.s(s[0]),.ca(ca1));
fa fa2(.a(a[1]),.b(b[1]),.c(ca1),.s(s[1]),.ca(ca2));
fa fa3(.a(a[2]),.b(b[2]),.c(ca2),.s(s[2]),.ca(ca3));
fa fa4(.a(a[3]),.b(b[3]),.c(ca3),.s(s[3]),.ca(ca));
endmodule


