$   if (f$search("Encryption.obj") .nes. "") then delete Encryption.obj;*
$   if (f$search("Encryption.exe") .nes. "") then delete Encryption.exe;*
$!
$! Compile and link Encryption
$!
$   dbl Encryption
$   link Encryption,sys$input:/opt
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
$   delete Encryption.obj;*
$!
