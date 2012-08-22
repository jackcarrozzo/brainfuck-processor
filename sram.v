module sram (
	data    , // out: the data
    instr   , // out: instruction
	dataptr	, // data address
	instptr	, // instruction address
	memwrite, // write enable for
	datain , // new value for write
	clk		 // clock
);
	
output [7:0] data;
output [7:0] instr;

input [7:0] dataptr;
input [7:0] instptr;
input [7:0] datain;
input 		clk;
input		memwrite;

reg [7:0] data;
reg [7:0] instr;

reg [7:0] mem [0:1023];

always @(posedge clk)
	begin	
		if (memwrite) mem[dataptr]=datain;
		instr=mem[instptr];
		data =mem[dataptr];
	end
endmodule

