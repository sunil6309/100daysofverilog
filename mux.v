module mux(input a,
	input d1,
	input d2,
	output y);
   assign y=(~a&d1)|(a&d2);
endmodule		
