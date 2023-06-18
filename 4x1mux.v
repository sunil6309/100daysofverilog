module mux4x1(input a,
        input b,
        input[0:3]z,
        output y);
        wire w1,w2;
        mux MUX1(.a(a),.d1(z[0]),.d2(z[1]),.y(w1));
        mux MUX2(.a(a),.d1(z[2]),.d2(z[3]),.y(w2));
        mux MUX3(.a(b),.d1(w1),.d2(w2),.y(y));
endmodule

