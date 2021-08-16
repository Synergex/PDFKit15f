$   if (f$search("TextDemo.obj") .nes. "") then delete TextDemo.obj;*
$   if (f$search("TextDemo.exe") .nes. "") then delete TextDemo.exe;*
$!
$! Compile and link TextDemo
$!
$   dbl TextDemo
$   link TextDemo,sys$input:/opt
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
$   delete TextDemo.obj;*
$!
