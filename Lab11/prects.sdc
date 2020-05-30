#***************************************************
# Timing constraint file in PT format
#
# - Note: This is all case-sensitive
#***************************************************

#***************************************************
# Clock Constraints	
#***************************************************
create_clock -name {clk} -period 5.0000000 -waveform { 0.0000000 2.5000000}\
   [list [get_ports {clk}]]


set_input_delay 1.0 -clock clk [all_inputs]
set_output_delay 1.0 -clock clk [all_outputs]

