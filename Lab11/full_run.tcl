###################################
# Run the design through Innovus
# Modified for Innovus 16.1
###################################

# Setup the design layout basics
source setup.tcl

# Add supply rings around core
source supply_rings.tcl

# Place the design's standard cells
source place_cells.tcl

# Route power nets
sroute


# Perform trial route and get initial timing results pre-Clock Tree Synthesis (CTS)
source pre_cts_route.tcl

# Perform pre-CTS optimization
source pre_cts_opt.tcl

# Clock tree synthesis
# generate the clock tree routing and buffering where necessary
# Currently does not work with the OSU 0.5u library setup -> Clocks are connected but unbalanced.
#clockDesign

# Perform trial route and get preliminary timing results including effects of clock tree insertion
source post_cts_opt.tcl

# Handle finishing touches to cells and connections
source final_route.tcl

# Add metal fill
# Only run metal fill after all other constraints are met (such as timing)
#source metal_fill.tcl

# Further optimize now that everything is present
source final_opt.tcl

# Run DRC and Connection checks
verifyConnectivity -type all -error 1000 -warning 50
verify_drc

# Export the design for use with Virtuoso
source export.tcl

puts "**************************************"
puts "* Encounter script finished          *"
puts "*                                    *"
puts "* Results:                           *"
puts "* --------                           *"
puts "* Layout:  final.gds2                *"
puts "* Netlist: final.v                   *"
puts "* Timing:  timing.rep.5.final        *"
puts "*                                    *"
puts "* Type 'win' to get the Main Window  *"
puts "* or type 'exit' to quit             *"
puts "*                                    *"
puts "**************************************"


