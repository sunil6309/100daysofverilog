module sipo(clk,clr,a,out);
  input clk,clr,a;
  output [3:0]out;
  reg[3:0]q;
   assign out=q;
  always@(posedge clk)
    begin
      if(clr)
        q<=4'b0000;
       
      else
        begin
          q[0]<=a;
          q[1]<=q[0];
          q[2]<=q[1];
          q[3]<=q[2];
         
        end
    end
endmodule
      
