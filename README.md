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

