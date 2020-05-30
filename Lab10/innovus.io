# This file specifies how the pads are placed
# The name of each pad here has to match the
# name in the verilog code
# The target padframe has 4 corners cells and 40 side pads
# Each side should have at least 1 vdd/gnd pair
# Use filler cells (PADNC) to fill up each side to 10 pads each
# Each pad instance needs it's orientation specified

Version: 2

Orient: R270 
Pad: c00 NE PADFC
Orient: R180 
Pad: c03 SE PADFC
Orient: R90
Pad: c02 SW PADFC
Orient: R0
Pad: c01 NW PADFC

Orient: R0
Pad: U5 N
Orient: R0
Pad: FN0 N PADNC
Orient: R0
Pad: FN1 N PADNC
Orient: R0
Pad: FN2 N PADNC
Orient: R0
Pad: P0 N PADVDD
Orient: R0
Pad: G0 N PADGND
Orient: R0
Pad: FN3 N PADNC
Orient: R0
Pad: FN4 N PADNC
Orient: R0
Pad: FN5 N PADNC
Orient: R0
Pad: U6 N


Orient: R90
Pad: FW1 W PADNC
Orient: R90
Pad: FW2 W PADNC
Orient: R90
Pad: U1 W
Orient: R90
Pad: FW3 W PADNC
Orient: R90
Pad: P1 W PADVDD
Orient: R90
Pad: G1 W PADGND
Orient: R90
Pad: FW4 W PADNC
Orient: R90
Pad: U2 W
Orient: R90
Pad: FW5 W PADNC
Orient: R90
Pad: FW6 W PADNC


Orient: R180
Pad: U8 S
Orient: R180
Pad: U9 S
Orient: R180
Pad: U10 S
Orient: R180
Pad: U11 S
Orient: R180
Pad: P2 S PADVDD
Orient: R180
Pad: G2 S PADGND
Orient: R180
Pad: U12 S
Orient: R180
Pad: U13 S
Orient: R180
Pad: U14 S
Orient: R180
Pad: U15 S

Orient: R270
Pad: FE1 E PADNC
Orient: R270
Pad: U3 E
Orient: R270
Pad: U4 E
Orient: R270
Pad: FE2 E PADNC
Orient: R270
Pad: P3 E PADVDD
Orient: R270
Pad: G3 E PADGND
Orient: R270
Pad: FE3 E PADNC
Orient: R270
Pad: U7 E
Orient: R270
Pad: U16 E
Orient: R270
Pad: FE4 E PADNC




