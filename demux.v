module demux(input[1:0]s,input a,output reg[3:0]d);
always@(*)
begin
case(s)
2'b00: begin d[0]=a; d[3:1]=0; end
2'b01: begin d[1]=a; d[0]=0;   end
2'b10: begin d[2]=a; d[1:0]=0; end
2'b11: begin d[3]=a; d[2:0]=0; end
endcase
end
endmodule

