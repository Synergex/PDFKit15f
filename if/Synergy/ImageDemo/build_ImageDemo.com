$   if (f$search("ImageDemo.obj") .nes. "") then delete ImageDemo.obj;*
$   if (f$search("ImageDemo.exe") .nes. "") then delete ImageDemo.exe;*
$!
$! Compile and link ImageDemo
$!
$   dbl ImageDemo
$   link ImageDemo,sys$input:/opt
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
$   delete ImageDemo.obj;*
$!
