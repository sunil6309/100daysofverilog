module muxbeh(input [0:1]sel,
		input[0:3]a,
		output reg y);
always @(sel,a)
 begin 
  case(sel)
   2'b00 : y=a[0];
   2'b01 : y=a[1];
   2'b10 : y=a[2];
   2'b11 : y=a[3];
  endcase
 end 
endmodule
