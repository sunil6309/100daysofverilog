module fulsub(input a,b,c,
	output diff,borr);
wire w1,w2,w3;
hs hs1(.a(a),.b(b),.diff(w1),.borr(w2));
hs hs2(.a(w1),.b(c),.diff(diff),.borr(w3));
or or1(borr,w2,w3);
endmodule
