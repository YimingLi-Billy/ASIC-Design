setOptMode -yieldEffort none
setOptMode -highEffort
setOptMode -maxDensity 0.95
setOptMode -drcMargin 0.0
setOptMode -holdTargetSlack 0.0 -setupTargetSlack 0.0
setOptMode -noSimplifyNetlist
optDesign -preCTS -drv
