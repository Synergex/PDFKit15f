$   if (f$search("SlideShowDemo.obj") .nes. "") then delete SlideShowDemo.obj;*
$   if (f$search("SlideShowDemo.exe") .nes. "") then delete SlideShowDemo.exe;*
$!
$! Compile and link SlideShowDemo
$!
$   dbl SlideShowDemo
$   link SlideShowDemo,sys$input:/opt
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
$   delete SlideShowDemo.obj;*
$!
