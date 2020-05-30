# Get final timing results
setExtractRCMode -engine postRoute -effortLevel low -reduce 0.0
extractRC

# Enable Active Timing Analysis by user
setAnalysisMode -analysisType onChipVariation

# Post-Route Optimization
setOptMode -yieldEffort none
setOptMode -effort high
setOptMode -maxDensity 0.95
setOptMode -drcMargin 0.0
setOptMode -holdTargetSlack 0.0 -setupTargetSlack 0.0
setOptMode -simplifyNetlist false
setOptMode -usefulSkew false
optDesign -postRoute -incr 

# Add filler
addFiller -cell FILL -prefix FIL -fillBoundary
ecoRoute
