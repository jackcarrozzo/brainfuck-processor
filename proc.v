// set the opcodes. this takes the ascii value of 
// these keys so a brainfuck program can go straight
// into memory, at the expense of a few bits.
`define INCDP   ">"
`define DECDP   "<"
`define INCDATA "+"
`define DECDATA "-"
`define OUTONE  "."
`define INONE   ","
`define CONDJMP "["
`define JMPBACK "]"

module proc (
	dataptr	, // out: data address
	instptr	, // out: instruction address
	myoutput, // out: output from the program
	memwrite, // out: write enable for memory
	dataval , // out: new value when mem is written
	indata	, // the data pointed at
	inst	, // the instruction pointed at
	myin	, // data into the program
	clk		, // clock
	reset_	  // reset, active low
);
	
output [7:0] dataptr;
output [7:0] instptr;
output [7:0] myoutput;
output 		 memwrite;
output [7:0] dataval;

input [7:0] indata;
input [7:0] inst;
input [7:0] myin;
input 		clk;
input		reset_;

reg [7:0] data;
reg [7:0] dataptr;
reg [7:0] instptr;
reg [7:0] myoutput;
reg [7:0] dataval;
reg memwrite;

always @(posedge clk)
	begin
	data=indata;

	if (reset_) // run state
		begin
			memwrite=0;
			case (inst)
				`INCDP: begin
					dataptr=dataptr+1;
					instptr=instptr+1;
					end
				`DECDP: begin
					dataptr=dataptr-1; //allows wrapping
					instptr=instptr+1;
					end
				`INCDATA: begin
					data=data+1;
					dataval=data;
					memwrite=1;
					instptr=instptr+1;
					end
				`DECDATA: begin
					data=data-1;
                    dataval=data;
                    memwrite=1;
					instptr=instptr+1;
					end
				`OUTONE: begin
					myoutput=data;
					instptr=instptr+1;
					end
				`INONE: begin
					data=myin;
					dataval=data;
                    memwrite=1;
					instptr=instptr+1;
					end
				`CONDJMP: begin
					end
				`JMPBACK: begin
					end
				default: begin
					instptr=instptr+1;
					end
			endcase //undefined opcodes not supported
		end
	else
		begin
		dataptr=0;
		instptr=0;
		end

	end
endmodule

