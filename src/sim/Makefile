VERILOG := iverilog
VERILOGRUN := vvp
PROJECT := tbzed80

all: $(PROJECT) run

#the positive clock edge version 
$(PROJECT):	../../impl/gwsynthesis/zed80.vg \
			tbzed80.v
	$(VERILOG) \
		-l${GOWINPATH}/IDE/simlib/gw2a/prim_sim.v \
		../../impl/gwsynthesis/zed80.vg \
		tbzed80.v \
		-o $(PROJECT)

run: $(PROJECT)
	$(VERILOGRUN) $(PROJECT)

.PHONY: clean
clean:
	rm -rf $(PROJECT)

