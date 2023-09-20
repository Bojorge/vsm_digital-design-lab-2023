## Generated SDC file "Problema_1.out.sdc"

## Copyright (C) 2023  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 22.1std.1 Build 917 02/14/2023 SC Lite Edition"

## DATE    "Wed Sep 13 09:57:51 2023"

##
## DEVICE  "5CSEMA5F31C6"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {testN} -period 20.000 -waveform { 0.000 10.000 } [get_ports {clk}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {a[0]}]
set_input_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {a[1]}]
set_input_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {a[2]}]
set_input_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {a[3]}]
set_input_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {b[0]}]
set_input_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {b[1]}]
set_input_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {b[2]}]
set_input_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {b[3]}]
set_input_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {opcode[0]}]
set_input_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {opcode[1]}]
set_input_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {opcode[2]}]
set_input_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {opcode[3]}]
set_input_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {reset}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {C}]
set_output_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {N}]
set_output_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {V}]
set_output_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {Z}]
set_output_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {result[0]}]
set_output_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {result[1]}]
set_output_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {result[2]}]
set_output_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {result[3]}]
set_output_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {segments[0]}]
set_output_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {segments[1]}]
set_output_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {segments[2]}]
set_output_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {segments[3]}]
set_output_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {segments[4]}]
set_output_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {segments[5]}]
set_output_delay -add_delay  -clock [get_clocks {testN}]  1.000 [get_ports {segments[6]}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

