$   if (f$search("FontDemo.obj") .nes. "") then delete FontDemo.obj;*
$   if (f$search("FontDemo.exe") .nes. "") then delete FontDemo.exe;*
$!
$! Compile and link FontDemo
$!
$   dbl FontDemo
$   link FontDemo,sys$input:/opt
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
$   delete FontDemo.obj;*
$!
