$   if (f$search("simplepdf.obj") .nes. "") then delete simplepdf.obj;*
$   if (f$search("simplepdf.exe") .nes. "") then delete simplepdf.exe;*
$!
$! Compile and link simplepdf
$!
$   dbl simplepdf
$   link simplepdf,sys$input:/opt
$ DECK
CLUSTER =       SYNERGY$$CODE
COLLECT =       SYNERGY$$CODE,$DBLTRNSF_CODE,$CODE$
CLUSTER =       SYNERGY$$READONLY
COLLECT =       SYNERGY$$READONLY,$DBG$,$DBL_ADDR,$DBL_CODE,$DBL_LINCTL,$DBL_LITERAL
DBLTLIB/LIB
PDFDBL/SHARE
SYNRTL/SHARE
$ EOD
$!
