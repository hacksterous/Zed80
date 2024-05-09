VERILOG = iverilog
PROJECT := tbje6850

all: $(PROJECT) run

tbje6850:  uart.v je6850.v tbje6850.v
	$(VERILOG) uart.v je6850.v tbje6850.v -o $(PROJECT)

run: $(PROJECT)
	vvp $(PROJECT)

.PHONY: clean
clean:
	rm -rf $(PROJECT)

