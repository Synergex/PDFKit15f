$   if (f$search("LineDemo.obj") .nes. "") then delete LineDemo.obj;*
$   if (f$search("LineDemo.exe") .nes. "") then delete LineDemo.exe;*
$!
$! Compile and link LineDemo
$!
$   dbl LineDemo
$   link LineDemo,sys$input:/opt
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
$   delete LineDemo.obj;*
$!
