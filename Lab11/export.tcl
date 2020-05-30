# Output GDSII
streamOut final.gds2 -mapFile gds2_innovus.map -outputMacros -stripes 1 -units 1000 -mode ALL
saveNetlist -excludeLeafCell final.v

# Output DSPF RC Data
rcout -spf final.dspf
