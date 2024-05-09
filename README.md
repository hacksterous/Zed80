# Zed80
## Grant Searle's SimpleZ80 implemented on Gowin FPGA (Tang Tano 20K)

Zed80 is an FPGA implementation of [Grant Searle's](http://searle.x10host.com/z80/SimpleZ80.html) computer built around Z80, the Motorola 6850 ACIA and a ROM/RAM.
The schematic is shown below:

![Grant Searle's SimpleZ80](http://searle.x10host.com/z80/Z80SbcSchematic1.3.gif "Schematic of Grant Searle's SimpleZ80")

## ACIA 6850
The  Asynchronous Communications Interface Adapter(ACIA) Mototola 6850 is implemeted as a *just-enough* Verilog module that talks to an FTDI UART-USB dongle.The only supported UART mode as of now is 8N1.

## Pins on the Tang Nano 20K  

Pin Number | Function | Description 
--- | --- | ---
73 | `UART_RX` | Z80 receive
74 | `UART_TX` | Z80 transmit
75 | `nRTS` | Z80 requests to send
15 | `HEARTBEAT` | LED0 flashes about 0.4Hz
88 | `areset` | Active high reset connected to button Key 1 on board
10 | `clk29` | 29.491MHz clock from Clock 1 of Aux-PLL on board.

## Setting Up Clock on Tang Nano 20K

See [Sipeed wiki](https://wiki.sipeed.com/hardware/en/tang/tang-nano-20k/example/unbox.html)

## Z80 Verilog Code

The core used is Guy Hutchison's [TV80](https://opencores.org/projects/tv80). The negative-edge trigerred top module `tv80n`
is used. The only change I made was to change all flops to use synchronous reset.

## ROM Code

The Intel hex format [ROM code from Grant Searle's site](http://searle.x10host.com/z80/sbc_NascomBasic.zip) had to be converted to the format the Gowin synthesis understands for preloading into the 8kB ROM implementation.

## Simulation
Simulation uses the Verilog netlist output of the Gowin synthesis tool. The simulation tool is [Icarus Verilog](https://github.com/steveicarus/iverilog).

The file is named `./impl/gwsynthesis/zed80.vg`.

`$ export GOWINPATH="/path/to/Gowin IDE installation"`

`$ cd sim`

`$ make`

This will compile and simulate the ROM binary. The output VCD file can be viewed on GTKWave.

## Implementation

Open `zed80.gprj` in Gowin IDE and run the bitstream generation flow. The default build generates a bit file usable for analysis on the logic analyzer/oscilloscope tool: `./impl/pnr/ao_0.fs`.
Use the programmer to upload the bit file to the FPGA.

## Connecting to a PC's Serial Port

Connect using 8N1 at 19200 baud. Here the command
`$ minicom -b 19200 -D /dev/ttyUSB0` is used.

![screenshot-zed80-msbasic](https://github.com/hacksterous/Zed80/assets/16697108/90b0a40d-cfdb-4bdb-a2d6-029dc509fc30)

![screenshot-zed80](https://github.com/hacksterous/Zed80/assets/16697108/e3801b1f-b143-483d-9958-a0bfbf1a8637)

