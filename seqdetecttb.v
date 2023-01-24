module seqdetecttb();

reg in,clk,rst;
wire out;

seqdet dut(in,clk,rst,out);

initial begin
clk=0;
rst=1'b1;
#2 rst=1'b0;
#2 in=1'b0;
#9 in=1'b1;
#10 in=1'b1;
#10 in=1'b1;
#10 in=1'b0;
#9 in=1'b1;
#10 in=1'b1;
#10 in=1'b1;
#10 $stop;
end
always #5clk=~clk;
endmodule
