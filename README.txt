A brainfuck system in Verilog
============================
Jack Carrozzo <jack@crepinc.com> 2012-08-22

* Why would you do this? 
	My friend Ken Stein designed a branfuck system
out of 7400 series logic chips, and I was impressed. I
haven't done much in Verilog so this was something to 
play with.

* What does it do?
	In simulation, the system loads an ascii 
brainfuck program from a memory list into SRAM, then
begins execution at cell 0. A perl script is provided
to convert a standard textual brainfuck program into
the memlist format. The program then runs, with input
being set by the registers in the testbench and output
coming out the dataout wire.
	If you were to synthesise and burn the code as
is, the SRAM would be included on the FPGA and could be
preloaded with your code if for some odd reason you 
wanted to do so. 
	I'd like to abstract the odd RAM behavior into
the processor code itself, such that the code could be
burned into hardware and it would interface a real SRAM
chip properly. Doing so however would require more clock
cycles for fetching and setting... not that this is at 
all a performance-driven project ;-)

* How do I run this?
	Just say 'make'. It will build, simulate, then 
open the wave viewer for you.

* TODOs:
	- Write the opcode handlers for [ and ]
	- Move the odd RAM code into the processor so
		we can interface a standard SRAM

* Requirements:
	You need iVerilog (provides both iverilog and 
vvp) and gtkwave. Packages are available for anything
you might want. 

* Why Verilog?
	I started writing this in VHDL but there are 
no working implementations out there other than the 
fat IDEs from Xilinx and Altera. They admittedly work
but I just prefer Vim and Makefiles vs clicking 30
buttons to make anything happen. If you know of a 
VHDL implementation that runs on OSX and nix, do let
me know!

- Debian/Ubuntu, as root:
apt-get install iverilog gtkwave

- OSX:
brew install iverilog
brew install gtkwave
