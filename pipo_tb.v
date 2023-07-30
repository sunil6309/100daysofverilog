module pipo_tb;
reg clk,rst;
reg[3:0]a;
wire[3:0]q;
parameter Thold =5,
	Tsetup=5,
	cycle=10; 
pipo SUN(clk,rst,a,q);

always
begin
#(cycle/2) clk=1'b0;
#(cycle/2) clk=1'b1;
end

task reset;
begin
a=4'd2;
rst=1'b1;
@(posedge clk)
#(Thold)
if(q!==0)
	begin
        $display("reset is not working");
	$display("at time %t ",$time);
	end
$display("reset is working");
{rst,a}=5'bx;
#(cycle - Tsetup - Thold);
end
endtask

task loading_up(input stim);
begin
a=stim;
rst=1'b0;
@(posedge clk)
#(Thold)
if(q!==a)
	begin
        $display("design is not working");
	$display("at time %t ",$time);
	end
$display("design is working");
{rst,a}=5'bx;
#(cycle - Tsetup - Thold);
end
endtask

initial
begin
reset;
loading_up(5);
loading_up(6);
loading_up(7);
reset;
loading_up(8);
loading_up(9);
reset;
#100 $finish;
end
endmodule
