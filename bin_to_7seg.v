module bin_to_7seg(in,out,dot);
input[3:0]in;
output reg[7:0]out;
output[7:0]dot;
assign dot=8'b11111110;//a(1),b(2),c(3),d(4),e(5),f(6),g(7),dot(8).
always@(*)
begin
case(in)
	0:out=8'b00000011;//a,b,c,d,e,f.(0)
	1:out=8'b10011111;//one
        2:out=8'b00100101;  //two
        3:out = 8'b00001101;  //three
        4:out = 8'b10011001;  //four
        5:out = 8'b01001001;  //five
        6:out = 8'b01000001;  //six
        7:out = 8'b00011111;  //seven
        8:out = 8'b00000001;  //eight
        9:out = 8'b00001001;  //nine
        10:out = 8'b00010001;  //A
        11:out = 8'b11000001;  //b
        12:out = 8'b01100011;  //C
        13:out = 8'b10000101;  //d
        14:out = 8'b01100001;  //E
        15:out = 8'b01110001;  //F
    endcase
end
endmodule



