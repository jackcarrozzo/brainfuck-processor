module bf_tb;

	reg reset = 0;
	initial begin
		$dumpvars;
		$readmemh("helloworld.mem",myram.mem);

		reset = 0;
		clock = 1;
		#10 reset = 1;
		#300 $finish;
	end

	reg clock = 0;
	always #10 clock = !clock;

	wire [7:0] dataptr;
	wire [7:0] instptr;
	wire [7:0] myout;
	wire memwrite;
	wire [7:0] memval;
	wire [7:0] data;
	wire [7:0] instr;
	wire [7:0] myin;

	proc myproc (dataptr,instptr,myout,memwrite,memval,data,instr,myin,clock,reset); 

	sram myram (data,instr,dataptr,instptr,memwrite,memval,clock);

endmodule
