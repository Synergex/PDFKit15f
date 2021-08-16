$   if (f$search("Permission.obj") .nes. "") then delete Permission.obj;*
$   if (f$search("Permission.exe") .nes. "") then delete Permission.exe;*
$!
$! Compile and link Permission
$!
$   dbl Permission
$   link Permission,sys$input:/opt
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
$   delete Permission.obj;*
$!
