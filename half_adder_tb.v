module half_adder_tb;
	reg a_tb;
	reg b_tb;
	wire sum_tb;
	wire carry_tb;


	integer i;
	
	half_adder DUT(.a(a_tb),.b(b_tb),.sum(sum_tb),.carry(carry_tb));
	initial
	begin
	   for(i = 0;i < 4;i = i + 1)
	    begin
	      {a_tb,b_tb}=i;
	      #100;
	     end
	end
endmodule
