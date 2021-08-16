$   if (f$search("OutlineDemo.obj") .nes. "") then delete OutlineDemo.obj;*
$   if (f$search("OutlineDemo.exe") .nes. "") then delete OutlineDemo.exe;*
$!
$! Compile and link OutlineDemo
$!
$   dbl OutlineDemo
$   link OutlineDemo,sys$input:/opt
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
$   delete OutlineDemo.obj;*
$!
