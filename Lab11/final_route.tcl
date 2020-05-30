# Add filler cells
addFiller -cell FILL

# Connect all new cells to VDD/GND
globalNetConnect vdd -type tiehi
globalNetConnect vdd -type pgpin -pin vdd -all -override

globalNetConnect gnd -type tielo
globalNetConnect gnd -type pgpin -pin gnd -all -override

# Route power nets (might not need this)
sroute 

# Route
globalDetailRoute
