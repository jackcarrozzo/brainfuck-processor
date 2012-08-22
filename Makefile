all: build sim show clean

build:
	iverilog -o bf_bin bf_tb.v proc.v sram.v

sim:
	vvp bf_bin -vcd

show:
	gtkwave dump.vcd

clean:
	rm -fr bf_bin dump.vcd

