$   if (f$search("RawImageDemo.obj") .nes. "") then delete RawImageDemo.obj;*
$   if (f$search("RawImageDemo.exe") .nes. "") then delete RawImageDemo.exe;*
$!
$! Compile and link RawImageDemo
$!
$   dbl RawImageDemo
$   link RawImageDemo,sys$input:/opt
$ DECK
CLUSTER =       SYNERGY$$CODE
COLLECT =       SYNERGY$$CODE,$DBLTRNSF_CODE,$CODE$
CLUSTER =       SYNERGY$$READONLY
COLLECT =       SYNERGY$$READONLY,$DBG$,$DBL_ADDR,$DBL_CODE,$DBL_LINCTL,$DBL_LITERAL
DBLTLIB/LIB
PDFDBL/SHARE
SYNRTL/SHARE
$ EOD
$   exit
$!
$! Remove the temporary files
$!
$   delete RawImageDemo.obj;*
$!
