trialroute
timeDesign -postCTS 
# reports are in timingReports subdirectory of project

# Extract RC
setExtractRCMode -assumeMetFill
extractRC -outfile encounter.cap

# Perform post-CTS optimization
setOptMode -yieldEffort none
setOptMode -highEffort
setOptMode -maxDensity 0.95
setOptMode -drcMargin 0.0
setOptMode -holdTargetSlack 0.0 -setupTargetSlack 0.0
setOptMode -noSimplifyNetlist
optDesign -postCTS -hold 
optDesign -postCTS -drv 

# see the .ctsrpt file for report on max clock skew
reportClockTree -postRoute -localSkew -report skew.post_troute_local.ctsrpt
