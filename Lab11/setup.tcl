# Setup design and create floorplan
source init.tcl

# Create Floorplan
floorplan -r 1.0 0.6 50 50 50 50
unfixAllIos
legalizePin
