//Copyright (C)2014-2024 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//Tool Version: V1.9.9.02 
//Created Time: 2024-05-06 13:43:31
create_clock -name clk29 -period 34.483 -waveform {0 17.241} [get_ports {clk29}]
create_clock -name clk -period 137.932 -waveform {0 68.966} [get_pins {ubaudClock/clkdiv_inst/CLKOUT}]
