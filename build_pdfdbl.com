$   if (f$search("*.dbp") .nes. "") then delete *.dbp;*
$   if (f$search("pdfdbl.obj") .nes. "") then delete pdfdbl.obj;*
$   if (f$search("pdfdbl.exe") .nes. "") then delete pdfdbl.exe;*
$!
$   dblproto pdfdbl.dbl
$   dbl pdfdbl.dbl
$!
$   if ((f$getsyi("ARCH_TYPE") .eq. 2) .or. (f$getsyi("ARCH_TYPE") .eq. 3))
$   then					! build on AXP/VMS or I64/VMS
$	copy sys$input: pdfdbl.opt
$ DECK
CLUSTER =       RMTELB_DATA
COLLECT =       RMTELB_DATA,$DATA,$DBL_DATA
CLUSTER =       SYNERGY$$CODE
COLLECT =       SYNERGY$$CODE,$DBLTRNSF_CODE,$CODE$
CLUSTER =       SYNERGY$$READONLY
COLLECT =       SYNERGY$$READONLY,$DBG$,$DBL_ADDR,$DBL_CODE,$DBL_LINCTL,$DBL_LITERAL
SYS$SHARE:DBLTLIB/LIB
SYS$SHARE:SYNRTL/SHARE
SYMBOL_VECTOR=( -
ERRORPROC=PROCEDURE,- ! ERRORPROC
5HPDF1SYNHLPR5PTRTSTRNGS1TEAM03=PROCEDURE,- ! HPDF.SYNHELPER.PTR_TO_STRING(I)@SYSTEM.STRING
5HPDF1SYNHLPR3FRMTRRRSYIDKG6K11=PROCEDURE,- ! HPDF.SYNHELPER.FORMATERROR(I,I)@SYSTEM.STRING
5HPDF1SYNHLPR2FLEXSTSOSY1K1A4C1=PROCEDURE,- ! HPDF.SYNHELPER.FILEEXISTS(@SYSTEM.STRING)I
5HPDF1SYNHLPR0STRNGTCHROTF0EAE2=PROCEDURE,- ! HPDF.SYNHELPER.STRING_TO_CHARSTAR(@SYSTEM.STRING)A
5HPDF1SYNHLPR6NTVFLNMAOSI1FBLA1=PROCEDURE,- ! HPDF.SYNHELPER.NATIVEFILENAME(@SYSTEM.STRING)A
5HPDF1SYNHLPR6NTVFLNMAOSKGS2AM0=PROCEDURE,- ! HPDF.SYNHELPER.NATIVEFILENAME(@SYSTEM.STRING,I)A
5HPDF8HPDFDC7HPDFGTVRSONCFCGU43=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_GETVERSION()I
5HPDF8HPDFDOC9HPDF_NEW_III=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_NEW(I,I)I
5HPDF8HPDFDOC11HPDF_FREE_XI=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_FREE(I)
5HPDF8HPDFDOC13HPDF_NEWDOC_II=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_NEWDOC(I)I
5HPDF8HPDFDOC14HPDF_FREEDOC_II=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_FREEDOC(I)I
5HPDFHPDFDC7HPDFFREDCLLIORR5E90=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_FREEDOCALL(I)I
5HPDF8HPDFDOC13HPDF_HASDOC_II=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_HASDOC(I)I
5HPDFHPDFDC7HPDFSVTFLIIOKNMODB3=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_SAVETOFILE(I,@SYSTEM.STRING)I
5HPDF8HPDFDOC5HPDFGTRRRIFSIJD70=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_GETERROR(I)I
5HPDFHPDFDC1HPDFGTRRRDIISAHQT73=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_GETERRORDETAIL(I)I
5HPDF8HPDFDC7HPDFRSTRRRXINF6M11=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_RESETERROR(I)
5HPDFHPDFDC8HPDFSTPGSOIIGUO1P63=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_SETPAGESCONFIGURATION(I,I)I
5HPDFHPDFDC1HPDFGTPGBYIIHQKB4T1=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_GETPAGEBYINDEX(I,I)I
5HPDFHPDFDC0HPDFGTPGU16ULKO86V1=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_GETPAGELAYOUT(I)$HPDF.HPDFPAGELAYOUT
5HPDFHPDFDC0HPDFSTPUI16U8NQ3EI3=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_SETPAGELAYOUT(I,$HPDF.HPDFPAGELAYOUT)I
5HPDFHPDFDC8HPDFGTPGM14I9CMD7D1=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_GETPAGEMODE(I)$HPDF.HPDFPAGEMODE
5HPDFHPDFDC8HPDFSTPGII14V7SU692=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_SETPAGEMODE(I,$HPDF.HPDFPAGEMODE)I
5HPDFHPDFDC0HPDFSTPNCOIIIBL8162=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_SETOPENACTION(I,I)I
5HPDFHPDFDC6HPDFGTVEWRIIIAMSE23=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_GETVIEWERPREFERENCE(I)I
5HPDFHPDFDC6HPDFSTVEWIIITJ3KM53=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_SETVIEWERPREFERENCE(I,I)I
5HPDFHPDFDC1HPDFGTCRRNII507U7U1=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_GETCURRENTPAGE(I)I
5HPDF8HPDFDOC14HPDF_ADDPAGE_II=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_ADDPAGE(I)I
5HPDFHPDFDC7HPDFNSRTPIIIUEBSIG1=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_INSERTPAGE(I,I)I
5HPDFHPDFDC4HPDFGTFNTIOSVOJVJQ2=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_GETFONT(I,@SYSTEM.STRING,@SYSTEM.STRING)I
5HPDFHPDFDC8HPDFLADTYIIOKMPT3L1=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_LOADTYPE1FONTFROMFILE(I,@SYSTEM.STRING,@SYSTEM.STRING)I
5HPDFHPDFDC5HPDFLADTTIIOVR93F91=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_LOADTTFONTFROMFILE(I,@SYSTEM.STRING,I)I
5HPDFHPDFDC6HPDFLADTIIOIKSG2U71=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_LOADTTFONTFROMFILE2(I,@SYSTEM.STRING,I,I)I
5HPDFHPDFDC9HPDFDDII18IO1PK20C1=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_ADDPAGELABEL(I,I,$HPDF.HPDFPAGENUMSTYLE,I,@SYSTEM.STRING)I
5HPDFHPDFDC7HPDFSJPFNTSI9CG0PB1=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_USEJPFONTS(I)I
5HPDFHPDFDC7HPDFSKRFNTSIL4A1SR0=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_USEKRFONTS(I)I
5HPDFHPDFDC8HPDFSCNSFNTI2O71Q20=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_USECNSFONTS(I)I
5HPDFHPDFDC8HPDFSCNTFNTIUQS3293=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_USECNTFONTS(I)I
5HPDFHPDFDC0HPDFCAOUIIIO4I152S3=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_CREATEOUTLINE(I,I,@SYSTEM.STRING,I)I
5HPDFHPDFDC7HPDFGTNCDRIOPVMCU62=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_GETENCODER(I,@SYSTEM.STRING)I
5HPDFHPDFDC4HPDFGTCRRNTIVBKJBE3=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_GETCURRENTENCODER(I)I
5HPDFHPDFDC4HPDFSTCRRNIOUG6FNV1=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_SETCURRENTENCODER(I,@SYSTEM.STRING)I
5HPDFHPDFDC1HPDFSJPNCDNILCPTPI3=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_USEJPENCODINGS(I)I
5HPDFHPDFDC1HPDFSKRNCDNI9N61UR1=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_USEKRENCODINGS(I)I
5HPDFHPDFDC2HPDFSCNSNCDIIQ35F50=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_USECNSENCODINGS(I)I
5HPDFHPDFDC2HPDFSCNTNCDI7H5Q0C2=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_USECNTENCODINGS(I)I
5HPDFHPDFDC7HPDFLADPNIIOG3LM972=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_LOADPNGIMAGEFROMFILE(I,@SYSTEM.STRING)I
5HPDFHPDFDC8HPDFLADPNIIO55VM422=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_LOADPNGIMAGEFROMFILE2(I,@SYSTEM.STRING)I
5HPDFHPDFDC8HPDFLADJPIIOAI4ISC1=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_LOADJPEGIMAGEFROMFILE(I,@SYSTEM.STRING)I
5HPDFHPDFDC7HPDFLAIIOI16EBE80C3=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_LOADRAWIMAGEFROMFILE(I,@SYSTEM.STRING,I,I,$HPDF.HPDFCOLORSPACE)I
5HPDFHPDFDC6HPDFLAIII16IAEFUEG3=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_LOADRAWIMAGEFROMMEM(I,{I,I,I,$HPDF.HPDFCOLORSPACE,I)I
5HPDFHPDFDC8HPDFSTNAI14OAAG2882=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_SETINFOATTR(I,$HPDF.HPDFINFOTYPE,@SYSTEM.STRING)I
5HPDFHPDFDC2HPDFSTNAI149EA1V8M1=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_SETINFODATEATTR(I,$HPDF.HPDFINFOTYPE,$HPDF.HPDFDATE)I
5HPDFHPDFDC8HPDFGTNFAI14DAICFV3=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_GETINFOATTR(I,$HPDF.HPDFINFOTYPE)I
5HPDFHPDFDC8HPDFSTPSSWIOHUUV432=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_SETPASSWORD(I,@SYSTEM.STRING,@SYSTEM.STRING)I
5HPDFHPDFDC0HPDFSTPRMOIILLT2HD0=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_SETPERMISSION(I,I)I
5HPDFHPDFDC4HPDFSTOII17II99QHK0=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_SETENCRYPTIONMODE(I,$HPDF.HPDFENCRYPTMODE,I)I
5HPDFHPDFDC5HPDFSTCMOIII2KTU4A1=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_SETCOMPRESSIONMODE(I,I)I
5HPDFHPDFDC2HPDFCRATEXIIPCQCEN0=PROCEDURE,- ! HPDF.HPDFDOC.HPDF_CREATEEXTGSTATE(I)I
5HPDF8HPDFDOCP1_U=PROCEDURE,- ! HPDF.HPDFDOC.HPDFDOC()
5HPDF8HPDFDOC8DISPOSE_X=PROCEDURE,- ! HPDF.HPDFDOC.DISPOSE()
5HPDFHPDFDC0HPDFDCDSTRCTHI7PKP2=PROCEDURE,- ! HPDF.HPDFDOC.HPDFDOC_DESTRUCTOR
5HPDFHPDFDC6HPDFGTVRSONSI1BK713=PROCEDURE,- ! HPDF.HPDFDOC.HPDFGETVERSION()@SYSTEM.STRING
5HPDF8HPDFDOC7NEWDOC_X=PROCEDURE,- ! HPDF.HPDFDOC.NEWDOC()
5HPDF8HPDFDOC8FREEDOC_X=PROCEDURE,- ! HPDF.HPDFDOC.FREEDOC()
5HPDF8HPDFDOC12FREEDOCALL_X=PROCEDURE,- ! HPDF.HPDFDOC.FREEDOCALL()
5HPDF8HPDFDOC7HASDOC_I=PROCEDURE,- ! HPDF.HPDFDOC.HASDOC()I
5HPDFHPDFDC2SVTFLXSYSTMSI8T37U1=PROCEDURE,- ! HPDF.HPDFDOC.SAVETOFILE(@SYSTEM.STRING)
5HPDF8HPDFDOC9GETERROR_I=PROCEDURE,- ! HPDF.HPDFDOC.GETERROR()I
5HPDF8HPDFDOC16GTRRRDTILKUNUS61=PROCEDURE,- ! HPDF.HPDFDOC.GETERRORDETAIL()I
5HPDF8HPDFDOC12RESETERROR_X=PROCEDURE,- ! HPDF.HPDFDOC.RESETERROR()
5HPDFHPDFDC3STPGSCNFGRTOSULU8V0=PROCEDURE,- ! HPDF.HPDFDOC.SETPAGESCONFIGURATION(I)
5HPDFHPDFDC6GTPGBYNDXP9IJ3UJ7G2=PROCEDURE,- ! HPDF.HPDFDOC.GETPAGEBYINDEX(I)@HPDF.HPDFPAGE
5HPDFHPDFDC5GTPGLYUTS16U9SBVUS1=PROCEDURE,- ! HPDF.HPDFDOC.GETPAGELAYOUT()$HPDF.HPDFPAGELAYOUT
5HPDFHPDFDC5STPGLYUTX16UJV8DA23=PROCEDURE,- ! HPDF.HPDFDOC.SETPAGELAYOUT($HPDF.HPDFPAGELAYOUT)
5HPDFHPDFDC3GTPGMDSP14HP4MFLN52=PROCEDURE,- ! HPDF.HPDFDOC.GETPAGEMODE()$HPDF.HPDFPAGEMODE
5HPDFHPDFDC3STPGMDXSP14H65AMDR0=PROCEDURE,- ! HPDF.HPDFDOC.SETPAGEMODE($HPDF.HPDFPAGEMODE)
5HPDFHPDFDC5STPNCTONX17OVJ65DT0=PROCEDURE,- ! HPDF.HPDFDOC.SETOPENACTION(@HPDF.HPDFDESTINATION)
5HPDFHPDFDC1GTVEWRPRFRNIQ268MF1=PROCEDURE,- ! HPDF.HPDFDOC.GETVIEWERPREFERENCE()I
5HPDFHPDFDC1STVEWRPRFRNC1CBLUP0=PROCEDURE,- ! HPDF.HPDFDOC.SETVIEWERPREFERENCE(I)
5HPDFHPDFDC6GTCRRNTPGOP95K1SQP1=PROCEDURE,- ! HPDF.HPDFDOC.GETCURRENTPAGE()@HPDF.HPDFPAGE
5HPDFHPDFDCADDPGOP9HPDFPD25Q6R1=PROCEDURE,- ! HPDF.HPDFDOC.ADDPAGE()@HPDF.HPDFPAGE
5HPDFHPDFDC2INSRTPGOP9HOSBETPM1=PROCEDURE,- ! HPDF.HPDFDOC.INSERTPAGE(@HPDF.HPDFPAGE)@HPDF.HPDFPAGE
5HPDFHPDFDCGTFNTP9HPDFFNM0R3K61=PROCEDURE,- ! HPDF.HPDFDOC.GETFONT(@SYSTEM.STRING,@SYSTEM.STRING)@HPDF.HPDFFONT
5HPDFHPDFDC3LADTYPFNTFOODENUJL3=PROCEDURE,- ! HPDF.HPDFDOC.LOADTYPE1FONTFROMFILE(@SYSTEM.STRING,@SYSTEM.STRING)@SYSTEM.STRING
5HPDFHPDFDC0LADTTFNTFROI0AOONI0=PROCEDURE,- ! HPDF.HPDFDOC.LOADTTFONTFROMFILE(@SYSTEM.STRING,I)@SYSTEM.STRING
5HPDFHPDFDC1LADTTFNTFOIIQC8GPO2=PROCEDURE,- ! HPDF.HPDFDOC.LOADTTFONTFROMFILE2(@SYSTEM.STRING,I,I)@SYSTEM.STRING
5HPDFHPDFDC4ADDPGLBL18IO5FTSPF1=PROCEDURE,- ! HPDF.HPDFDOC.ADDPAGELABEL(I,$HPDF.HPDFPAGENUMSTYLE,I,@SYSTEM.STRING)
5HPDF8HPDFDOC12USEJPFONTS_I=PROCEDURE,- ! HPDF.HPDFDOC.USEJPFONTS()I
5HPDF8HPDFDOC12USEKRFONTS_I=PROCEDURE,- ! HPDF.HPDFDOC.USEKRFONTS()I
5HPDF8HPDFDOC13USECNSFONTS_I=PROCEDURE,- ! HPDF.HPDFDOC.USECNSFONTS()I
5HPDF8HPDFDOC13USECNTFONTS_I=PROCEDURE,- ! HPDF.HPDFDOC.USECNTFONTS()I
5HPDFHPDFDC5CAOUO13UOO13SGNS313=PROCEDURE,- ! HPDF.HPDFDOC.CREATEOUTLINE(@HPDF.HPDFOUTLINE,@SYSTEM.STRING,@HPDF.HPDFENCODER)@HPDF.HPDFOUTLINE
5HPDFHPDFDC2GTNCDRP13HPDHCD8AD2=PROCEDURE,- ! HPDF.HPDFDOC.GETENCODER(@SYSTEM.STRING)@HPDF.HPDFENCODER
5HPDFHPDFDC9GTCRRNTNCD132SEV0D2=PROCEDURE,- ! HPDF.HPDFDOC.GETCURRENTENCODER()@HPDF.HPDFENCODER
5HPDFHPDFDC9STCRRNTNCDRX1CGIRR0=PROCEDURE,- ! HPDF.HPDFDOC.SETCURRENTENCODER(@SYSTEM.STRING)
5HPDF8HPDFDOC6USJPNCDNGS4VOP5U3=PROCEDURE,- ! HPDF.HPDFDOC.USEJPENCODINGS()I
5HPDF8HPDFDOC6USKRNCDNGSDVSAHD0=PROCEDURE,- ! HPDF.HPDFDOC.USEKRENCODINGS()I
5HPDF8HPDFDC7USCNSNCDNGSH77QRR3=PROCEDURE,- ! HPDF.HPDFDOC.USECNSENCODINGS()I
5HPDF8HPDFDC7USCNTNCDNGS3FDR7G3=PROCEDURE,- ! HPDF.HPDFDOC.USECNTENCODINGS()I
5HPDFHPDFDC2LADPNGMGO11O8N4M5F2=PROCEDURE,- ! HPDF.HPDFDOC.LOADPNGIMAGEFROMFILE(@SYSTEM.STRING)@HPDF.HPDFIMAGE
5HPDFHPDFDC3LADPNGMGO11O7F7KV03=PROCEDURE,- ! HPDF.HPDFDOC.LOADPNGIMAGEFROMFILE2(@SYSTEM.STRING)@HPDF.HPDFIMAGE
5HPDFHPDFDC3LADJPGMGO11OVPGOV91=PROCEDURE,- ! HPDF.HPDFDOC.LOADJPEGIMAGEFROMFILE(@SYSTEM.STRING)@HPDF.HPDFIMAGE
5HPDFHPDFDC2LADRWO11OI16OE1I992=PROCEDURE,- ! HPDF.HPDFDOC.LOADRAWIMAGEFROMFILE(@SYSTEM.STRING,I,I,$HPDF.HPDFCOLORSPACE)@HPDF.HPDFIMAGE
5HPDFHPDFDC1LADRW11II16IMK90320=PROCEDURE,- ! HPDF.HPDFDOC.LOADRAWIMAGEFROMMEM({I,I,I,$HPDF.HPDFCOLORSPACE,I)@HPDF.HPDFIMAGE
5HPDFHPDFDC3STNFATTRX14O9UUDOI3=PROCEDURE,- ! HPDF.HPDFDOC.SETINFOATTR($HPDF.HPDFINFOTYPE,@SYSTEM.STRING)
5HPDFHPDFDC7STNFDTATT149HQKATR2=PROCEDURE,- ! HPDF.HPDFDOC.SETINFODATEATTR($HPDF.HPDFINFOTYPE,$HPDF.HPDFDATE)
5HPDFHPDFDC3GTNFATTRSY145LP3GL1=PROCEDURE,- ! HPDF.HPDFDOC.GETINFOATTR($HPDF.HPDFINFOTYPE)@SYSTEM.STRING
5HPDFHPDFDC3STPSSWRDXSYSJNCG7U2=PROCEDURE,- ! HPDF.HPDFDOC.SETPASSWORD(@SYSTEM.STRING,@SYSTEM.STRING)
5HPDF8HPDFDOC5STPRMSSONXMJDBBA2=PROCEDURE,- ! HPDF.HPDFDOC.SETPERMISSION(I)
5HPDFHPDFDC9STNCRYPTO17I976NT62=PROCEDURE,- ! HPDF.HPDFDOC.SETENCRYPTIONMODE($HPDF.HPDFENCRYPTMODE,I)
5HPDFHPDFDC0STCMPRSSONMDFL1AMH3=PROCEDURE,- ! HPDF.HPDFDOC.SETCOMPRESSIONMODE(I)
5HPDFHPDFDC7CRATEXTGSO157IT45P3=PROCEDURE,- ! HPDF.HPDFDOC.CREATEEXTGSTATE()@HPDF.HPDFEXTGSTATE
5HPDFHPDFDCADDPGOP91519OFBVIN33=PROCEDURE,- ! HPDF.HPDFDOC.ADDPAGE($HPDF.HPDFPAGESIZES,$HPDF.HPDFPAGEDIRECTION)@HPDF.HPDFPAGE
5HPDFHPDFDCADDPGOP91519O80REFK1=PROCEDURE,- ! HPDF.HPDFDOC.ADDPAGE($HPDF.HPDFPAGESIZES,$HPDF.HPDFPAGEDIRECTION,D,D)@HPDF.HPDFPAGE
5HPDFHPDFDC9ADDPGPRTRIO9KCKN683=PROCEDURE,- ! HPDF.HPDFDOC.ADDPAGEPORTRAITA4(D,D)@HPDF.HPDFPAGE
5HPDFHPDFDC0ADDPGLNDSAO9B9BL7D3=PROCEDURE,- ! HPDF.HPDFDOC.ADDPAGELANDSCAPEA4(D,D)@HPDF.HPDFPAGE
5HPDFHPDFDC3ADDPGPRTRIT9JPF3433=PROCEDURE,- ! HPDF.HPDFDOC.ADDPAGEPORTRAITLETTER(D,D)@HPDF.HPDFPAGE
5HPDFHPDFDC4ADDPGLNDSCP9V5TNAR1=PROCEDURE,- ! HPDF.HPDFDOC.ADDPAGELANDSCAPELETTER(D,D)@HPDF.HPDFPAGE
5HPDFHPDFPG0HPDFPGSTWDTI5ICI8I0=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETWIDTH(I,D)I
5HPDFHPDFPG1HPDFPGSTHIGICMBG9M3=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETHEIGHT(I,D)I
5HPDFHPDFPG9HPDFPII1519O9PU06R2=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETSIZE(I,$HPDF.HPDFPAGESIZES,$HPDF.HPDFPAGEDIRECTION)I
5HPDFHPDFPG1HPDFPGSTRIII3FUM4K2=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETROTATE(I,I)I
5HPDFHPDFPG9HPDFPGCRATOI21KGVQ3=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_CREATEDESTINATION(I)I
5HPDFHPDFPG7HPDFPGCRATI9HQ6MLT0=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_CREATETEXTANNOT(I,$HPDF.HPDFRECT,@SYSTEM.STRING,I)I
5HPDFHPDFPG7HPDFPGCRATI9NOJC851=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_CREATELINKANNOT(I,$HPDF.HPDFRECT,I)I
5HPDFHPDFPG0HPDFPGCRAUI9JQ68143=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_CREATEURILINKANNOT(I,$HPDF.HPDFRECT,@SYSTEM.STRING)I
5HPDFHPDFPG1HPDFPGTXTWDON9FT0H2=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_TEXTWIDTH(I,@SYSTEM.STRING)D
5HPDFHPDFPG3HPDFPGMASRIORVC2KD2=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_MEASURETEXT(I,@SYSTEM.STRING,D,I,D)I
5HPDFHPDFPG0HPDFPGGTWDTHFMNI6A3=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETWIDTH(I)D
5HPDFHPDFPG1HPDFPGGTHIGHHTFMO72=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETHEIGHT(I)D
5HPDFHPDFPG0HPDFPGGTGMIICPM1SP1=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETGMODE(I)I
5HPDFHPDFPG5HPDFPGGTC11I9F9UDK0=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETCURRENTPOS(I)$HPDF.HPDFPOINT
5HPDFHPDFPG9HPDFPGGTC11IHV3V9O1=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETCURRENTTEXTPOS(I)$HPDF.HPDFPOINT
5HPDFHPDFPG6HPDFPGGTCRRI86HOLI2=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETCURRENTFONT(I)I
5HPDFHPDFPG0HPDFPGGTCRRNBONTVI0=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETCURRENTFONTSIZE(I)D
5HPDFHPDFPG6HPDFPGGTTR17S2RKIC0=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETTRANSMATRIX(I)$HPDF.HPDFTRANSMATRIX
5HPDFHPDFPG4HPDFPGGTLNWD1C9JLB2=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETLINEWIDTH(I)D
5HPDFHPDFPG2HPDFPGGTLN130O5QLQ0=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETLINECAP(I)$HPDF.HPDFLINECAP
5HPDFHPDFPG3HPDFPGGTI14IS28JS42=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETLINEJOIN(I)$HPDF.HPDFLINEJOIN
5HPDFHPDFPG5HPDFPGGTMTRLA1JPPJ1=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETMITERLIMIT(I)D
5HPDFHPDFPG9HPDFPGGTD23IRQP6OT3=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETDASH(I)$HPDF.HPDFDASHMODE_INTERNAL
5HPDFHPDFPG9HPDFPGGTFLTDJ81MPA2=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETFLAT(I)D
5HPDFHPDFPG4HPDFPGGTCHRSOQ3CER3=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETCHARSPACE(I)D
5HPDFHPDFPG4HPDFPGGTWRDSL7L12I3=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETWORDSPACE(I)D
5HPDFHPDFPG8HPDFPGGTHRZSRRVE8L1=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETHORIZSCALLING(I)D
5HPDFHPDFPG6HPDFPGGTTXTALBVSJC1=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETTEXTLEADING(I)D
5HPDFHPDFPG2HPDFPGGTT23I796BLQ3=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETTEXTRENDERINGMODE(I)$HPDF.HPDFTEXTRENDERINGMODE
5HPDFHPDFPG4HPDFPGGTTXTIQB65BL1=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETTEXTRAISE(I)D
5HPDFHPDFPG2HPDFPGGTRG142LI4CB3=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETRGBFILL(I)$HPDF.HPDFRGBCOLOR
5HPDFHPDFPG4HPDFPGGTRG14KF4IAJ1=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETRGBSTROKE(I)$HPDF.HPDFRGBCOLOR
5HPDFHPDFPG3HPDFPGGTCM15HTJPHR0=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETCMYKFILL(I)$HPDF.HPDFCMYKCOLOR
5HPDFHPDFPG5HPDFPGGTCM15TH50P92=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETCMYKSTROKE(I)$HPDF.HPDFCMYKCOLOR
5HPDFHPDFPG3HPDFPGGTGRYFA5PLB30=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETGRAYFILL(I)D
5HPDFHPDFPG5HPDFPGGTGRYSOSJSFH1=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETGRAYSTROKE(I)D
5HPDFHPDFPG7HPDFPGGTS16IA0N66T2=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETSTCOLORSPACE(I)$HPDF.HPDFCOLORSPACE
5HPDFHPDFPG2HPDFPGGTF16I6RHNTO1=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETFILLINGCOLORSPACE(I)$HPDF.HPDFCOLORSPACE
5HPDFHPDFPG5HPDFPGGTTX17A99RVO3=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETTEXTMATRIX(I)$HPDF.HPDFTRANSMATRIX
5HPDFHPDFPG6HPDFPGGTGSTIRCETLT0=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GETGSTATEDEPTH(I)I
5HPDFHPDFPG4HPDFPGSTLNWILL8BI00=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETLINEWIDTH(I,D)I
5HPDFHPDFPG2HPDFPGSTLI13JDO5BE0=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETLINECAP(I,$HPDF.HPDFLINECAP)I
5HPDFHPDFPG3HPDFPGSII14I853NHF2=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETLINEJOIN(I,$HPDF.HPDFLINEJOIN)I
5HPDFHPDFPG5HPDFPGSTMTRI9C3QMJ0=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETMITERLIMIT(I,D)I
5HPDFHPDFPG9HPDFPGSTDIIIEFBMER3=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETDASH(I,{I,I,I)I
5HPDFHPDFPG9HPDFPGSTFLTI1EHDL73=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETFLAT(I,D)I
5HPDFHPDFPG4HPDFPGSTXIIIPOK9KL2=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETEXTGSTATE(I,I)I
5HPDF9HPDFPG7HPDFPGGSVII0IPK113=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GSAVE(I)I
5HPDFHPDFPG0HPDFPGGRSTII9AAJ8A0=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_GRESTORE(I)I
5HPDFHPDFPG8HPDFPGCNCTIDOQQT5O2=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_CONCAT(I,D,D,D,D,D,D)I
5HPDFHPDFPG8HPDFPGMVTIIDQ4V2TK3=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_MOVETO(I,D,D)I
5HPDFHPDFPG8HPDFPGLNTIIDN01K542=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_LINETO(I,D,D)I
5HPDFHPDFPG9HPDFPGCRVTIIMKE3K30=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_CURVETO(I,D,D,D,D,D,D)I
5HPDFHPDFPG0HPDFPGCRVTII4N8BCG1=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_CURVETO2(I,D,D,D,D)I
5HPDFHPDFPG0HPDFPGCRVTIIEHV8MT0=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_CURVETO3(I,D,D,D,D)I
5HPDFHPDFPG1HPDFPGCLSPTIS6MDB72=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_CLOSEPATH(I)I
5HPDFHPDFPG1HPDFPGRCTNII51CQS82=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_RECTANGLE(I,D,D,D,D)I
5HPDFHPDFPG8HPDFPGSTRKIIAGB24O0=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_STROKE(I)I
5HPDFHPDFPG7HPDFPGCLSPIID9CT3D1=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_CLOSEPATHSTROKE(I)I
5HPDF9HPDFPAG6HPDFPGFLLIO9US7H1=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_FILL(I)I
5HPDFHPDFPG8HPDFPGEOFLLI068JK13=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_EOFILL(I)I
5HPDFHPDFPG2HPDFPGFLLSII4DR7MT2=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_FILLSTROKE(I)I
5HPDFHPDFPG4HPDFPGEOFLIIG2QAFG3=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_EOFILLSTROKE(I)I
5HPDFHPDFPG1HPDFPGCLSPII8RKKCC0=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_CLOSEPATHFILLSTROKE(I)I
5HPDFHPDFPG9HPDFPGCPTOIIE1RUFJ3=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_CPATHEOFILLSTROKE(I)I
5HPDFHPDFPG9HPDFPGENDPTI5IPOV53=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_ENDPATH(I)I
5HPDF9HPDFPAG6HPDFPGCLPI0F2VCS1=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_CLIP(I)I
5HPDFHPDFPG8HPDFPGEOCLPIO0KGVC3=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_EOCLIP(I)I
5HPDFHPDFPG1HPDFPGBGNTXICJERCU2=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_BEGINTEXT(I)I
5HPDFHPDFPG9HPDFPGENDTXIVR4DT62=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_ENDTEXT(I)I
5HPDFHPDFPG4HPDFPGSTCHIIL48NEB0=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETCHARSPACE(I,D)I
5HPDFHPDFPG4HPDFPGSTWRIIBCR7QA2=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETWORDSPACE(I,D)I
5HPDFHPDFPG8HPDFPGSTHRZI8TSPCR2=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETHORIZSCALLING(I,D)I
5HPDFHPDFPG6HPDFPGSTTXAIIIEDRR1=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETTEXTLEADING(I,D)I
5HPDFHPDFPG6HPDFPGSTFIIIT2122U0=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETFONTANDSIZE(I,I,D)I
5HPDFHPDFPG2HPDFPGSTII23SE3DK50=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETTEXTRENDERINGMODE(I,$HPDF.HPDFTEXTRENDERINGMODE)I
5HPDFHPDFPG4HPDFPGSTTIIIFJ8O691=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETTEXTRAISE(I,D)I
5HPDFHPDFPG3HPDFPGMVTXTI2KKVG32=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_MOVETEXTPOS(I,D,D)I
5HPDFHPDFPG4HPDFPGMVTXII4EE30R1=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_MOVETEXTPOS2(I,D,D)I
5HPDFHPDFPG5HPDFPGSTTXTIKTRO203=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETTEXTMATRIX(I,D,D,D,D,D,D)I
5HPDFHPDFPG6HPDFPGMVTNIIE6E0OP2=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_MOVETONEXTLINE(I)I
5HPDFHPDFPG0HPDFPGSHWTIO1BT3453=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SHOWTEXT(I,@SYSTEM.STRING)I
5HPDFHPDFPG8HPDFPGSHWIIOM1J6IH3=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SHOWTEXTNEXTLINE(I,@SYSTEM.STRING)I
5HPDFHPDFPG0HPDFPGSHWTEI3INSMP0=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SHOWTEXTNEXTLINEEX(I,D,D,@SYSTEM.STRING)I
5HPDFHPDFPG3HPDFPGSTGRYIOAA1TB0=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETGRAYFILL(I,D)I
5HPDFHPDFPG5HPDFPGSTGRII27LN291=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETGRAYSTROKE(I,D)I
5HPDFHPDFPG2HPDFPGSTRGBIRLU0TB2=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETRGBFILL(I,D,D,D)I
5HPDFHPDFPG4HPDFPGSTRGII6V9EAI3=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETRGBSTROKE(I,D,D,D)I
5HPDFHPDFPG3HPDFPGSTCMYI1F2CKV1=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETCMYKFILL(I,D,D,D,D)I
5HPDFHPDFPG5HPDFPGSTCMIIQQU8BK3=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETCMYKSTROKE(I,D,D,D,D)I
5HPDFHPDFPG6HPDFPGEXCTIIAODHP43=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_EXECUTEXOBJECT(I,I)I
5HPDFHPDFPG1HPDFPGDRWIIICKLIRU1=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_DRAWIMAGE(I,I,D,D,D,D)I
5HPDFHPDFPG8HPDFPGCRCLIIAG79FC2=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_CIRCLE(I,D,D,D)I
5HPDFHPDFPG5HPDFPGARCIDD4C4M003=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_ARC(I,D,D,D,D,D)I
5HPDFHPDFPG9HPDFPGELLPIIPOMO5U3=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_ELLIPSE(I,D,D,D,D)I
5HPDFHPDFPG9HPDFPGTXTUTI89H87C3=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_TEXTOUT(I,D,D,@SYSTEM.STRING)I
5HPDFHPDFPG0HPDFPGTXTI1923INJL3=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_TEXTRECT(I,D,D,D,D,@SYSTEM.STRING,$HPDF.HPDFTEXTALIGNMENT,I)I
5HPDFHPDFPG4HPDFPGSTI21O83HV143=PROCEDURE,- ! HPDF.HPDFPAGE.HPDF_PAGE_SETSLIDESHOW(I,$HPDF.HPDFTRANSITIONSTYLE,D,D)I
5HPDF9HPDFPAGEP1_UII=PROCEDURE,- ! HPDF.HPDFPAGE.HPDFPAGE(I,I)
5HPDF9HPDFPAGE9SETWIDTH_XD=PROCEDURE,- ! HPDF.HPDFPAGE.SETWIDTH(D)
5HPDF9HPDFPAGE11SETHEIGHT_XD=PROCEDURE,- ! HPDF.HPDFPAGE.SETHEIGHT(D)
5HPDFHPDFPGSTSZXSP15H19OTFI6G73=PROCEDURE,- ! HPDF.HPDFPAGE.SETSIZE($HPDF.HPDFPAGESIZES,$HPDF.HPDFPAGEDIRECTION)
5HPDF9HPDFPAGE11SETROTATE_XI=PROCEDURE,- ! HPDF.HPDFPAGE.SETROTATE(I)
5HPDFHPDFPG9CRATDSTNO17O1OQE4J1=PROCEDURE,- ! HPDF.HPDFPAGE.CREATEDESTINATION()@HPDF.HPDFDESTINATION
5HPDFHPDFPG7CRATTX16O913SSPE0B0=PROCEDURE,- ! HPDF.HPDFPAGE.CREATETEXTANNOT($HPDF.HPDFRECT,@SYSTEM.STRING,@HPDF.HPDFENCODER)@HPDF.HPDFANNOTATION
5HPDFHPDFPG7CRATL16O917OF74FU31=PROCEDURE,- ! HPDF.HPDFPAGE.CREATELINKANNOT($HPDF.HPDFRECT,@HPDF.HPDFDESTINATION)@HPDF.HPDFANNOTATION
5HPDFHPDFPG0CRATURLN16O9Q3HQC61=PROCEDURE,- ! HPDF.HPDFPAGE.CREATEURILINKANNOT($HPDF.HPDFRECT,@SYSTEM.STRING)@HPDF.HPDFANNOTATION
5HPDFHPDFPG1TXTWDTHDSYST0MO2SP0=PROCEDURE,- ! HPDF.HPDFPAGE.TEXTWIDTH(@SYSTEM.STRING)D
5HPDFHPDFPG3MASRTXTOSYST986BC12=PROCEDURE,- ! HPDF.HPDFPAGE.MEASURETEXT(@SYSTEM.STRING,D,I,D)I
5HPDFHPDFPG3MASRTXTOSYST4BVM0Q2=PROCEDURE,- ! HPDF.HPDFPAGE.MEASURETEXT(@SYSTEM.STRING,D,I)I
5HPDF9HPDFPAGE9GETWIDTH_D=PROCEDURE,- ! HPDF.HPDFPAGE.GETWIDTH()D
5HPDF9HPDFPAGE11GETHEIGHT_D=PROCEDURE,- ! HPDF.HPDFPAGE.GETHEIGHT()D
5HPDF9HPDFPAGE9GETGMODE_I=PROCEDURE,- ! HPDF.HPDFPAGE.GETGMODE()I
5HPDFHPDFPG5GTCRRNTPS11ICC242A0=PROCEDURE,- ! HPDF.HPDFPAGE.GETCURRENTPOS()$HPDF.HPDFPOINT
5HPDFHPDFPG9GTCRRNTTX11IO0S8NU0=PROCEDURE,- ! HPDF.HPDFPAGE.GETCURRENTTEXTPOS()$HPDF.HPDFPOINT
5HPDFHPDFPG6GTCRRNTFNTP98FNB7N1=PROCEDURE,- ! HPDF.HPDFPAGE.GETCURRENTFONT()@HPDF.HPDFFONT
5HPDFHPDFPG0GTCRRNTFNTSZJ1J36G1=PROCEDURE,- ! HPDF.HPDFPAGE.GETCURRENTFONTSIZE()D
5HPDFHPDFPG6GTTRNSMTRX17TA5AEN1=PROCEDURE,- ! HPDF.HPDFPAGE.GETTRANSMATRIX()$HPDF.HPDFTRANSMATRIX
5HPDF9HPDFPAGE14GETLINEWIDTH_D=PROCEDURE,- ! HPDF.HPDFPAGE.GETLINEWIDTH()D
5HPDFHPDFPG2GTLNCPSP13HPJ7UBET3=PROCEDURE,- ! HPDF.HPDFPAGE.GETLINECAP()$HPDF.HPDFLINECAP
5HPDFHPDFPG3GTLNJINSP14I52NFKE3=PROCEDURE,- ! HPDF.HPDFPAGE.GETLINEJOIN()$HPDF.HPDFLINEJOIN
5HPDF9HPDFPAGE5GTMTRLMTDU4MA1D0=PROCEDURE,- ! HPDF.HPDFPAGE.GETMITERLIMIT()D
5HPDFHPDFPGGTDSHSP14HPDFUFLGRI1=PROCEDURE,- ! HPDF.HPDFPAGE.GETDASH()$HPDF.HPDFDASHMODE
5HPDF9HPDFPAGE8GETFLAT_D=PROCEDURE,- ! HPDF.HPDFPAGE.GETFLAT()D
5HPDF9HPDFPAGE14GETCHARSPACE_D=PROCEDURE,- ! HPDF.HPDFPAGE.GETCHARSPACE()D
5HPDF9HPDFPAGE14GETWORDSPACE_D=PROCEDURE,- ! HPDF.HPDFPAGE.GETWORDSPACE()D
5HPDFHPDFPG3GTHRZNTLSCLLQ6NHV31=PROCEDURE,- ! HPDF.HPDFPAGE.GETHORIZONTALSCALLING()D
5HPDF9HPDFPG6GTTXTLADNGDPEJ2RF0=PROCEDURE,- ! HPDF.HPDFPAGE.GETTEXTLEADING()D
5HPDFHPDFPG2GTTXTRNDRN238LG9O71=PROCEDURE,- ! HPDF.HPDFPAGE.GETTEXTRENDERINGMODE()$HPDF.HPDFTEXTRENDERINGMODE
5HPDF9HPDFPAGE14GETTEXTRAISE_D=PROCEDURE,- ! HPDF.HPDFPAGE.GETTEXTRAISE()D
5HPDFHPDFPG2GTRGBFLLSP14MOD1QE2=PROCEDURE,- ! HPDF.HPDFPAGE.GETRGBFILL()$HPDF.HPDFRGBCOLOR
5HPDFHPDFPG4GTRGBSTRKS14C3ANHG0=PROCEDURE,- ! HPDF.HPDFPAGE.GETRGBSTROKE()$HPDF.HPDFRGBCOLOR
5HPDFHPDFPG3GTCMYKFLLS151618P41=PROCEDURE,- ! HPDF.HPDFPAGE.GETCMYKFILL()$HPDF.HPDFCMYKCOLOR
5HPDFHPDFPG5GTCMYKSTRK158BA36T2=PROCEDURE,- ! HPDF.HPDFPAGE.GETCMYKSTROKE()$HPDF.HPDFCMYKCOLOR
5HPDF9HPDFPAGE13GETGRAYFILL_D=PROCEDURE,- ! HPDF.HPDFPAGE.GETGRAYFILL()D
5HPDF9HPDFPAG5GTGRYSTRKDG2FL0E0=PROCEDURE,- ! HPDF.HPDFPAGE.GETGRAYSTROKE()D
5HPDFHPDFPG3GTSTRKNGCL16JSB1EC3=PROCEDURE,- ! HPDF.HPDFPAGE.GETSTROKINGCOLORSPACE()$HPDF.HPDFCOLORSPACE
5HPDFHPDFPG2GTFLLNGCLR16TRU97G1=PROCEDURE,- ! HPDF.HPDFPAGE.GETFILLINGCOLORSPACE()$HPDF.HPDFCOLORSPACE
5HPDFHPDFPG5GTTXTMTRXS17BKA5FF0=PROCEDURE,- ! HPDF.HPDFPAGE.GETTEXTMATRIX()$HPDF.HPDFTRANSMATRIX
5HPDF9HPDFPAG6GTGSTTDPTHTF8KRF2=PROCEDURE,- ! HPDF.HPDFPAGE.GETGSTATEDEPTH()I
5HPDF9HPDFPAG4STLNWDTHXD1GM9A90=PROCEDURE,- ! HPDF.HPDFPAGE.SETLINEWIDTH(D)
5HPDFHPDFPG2STLNCPXSP13HL87MHR0=PROCEDURE,- ! HPDF.HPDFPAGE.SETLINECAP($HPDF.HPDFLINECAP)
5HPDFHPDFPG3STLNJINXS14IS2HPS81=PROCEDURE,- ! HPDF.HPDFPAGE.SETLINEJOIN($HPDF.HPDFLINEJOIN)
5HPDF9HPDFPAG5STMTRLMTXD36MM513=PROCEDURE,- ! HPDF.HPDFPAGE.SETMITERLIMIT(D)
5HPDF9HPDFPAGE8SETDASH_XYII=PROCEDURE,- ! HPDF.HPDFPAGE.SETDASH({I,I)
5HPDF9HPDFPAGE8SETFLAT_XD=PROCEDURE,- ! HPDF.HPDFPAGE.SETFLAT(D)
5HPDFHPDFPG4STXTGSTTXP15CCOO8T1=PROCEDURE,- ! HPDF.HPDFPAGE.SETEXTGSTATE(@HPDF.HPDFEXTGSTATE)
5HPDF9HPDFPAGE6GSAVE_X=PROCEDURE,- ! HPDF.HPDFPAGE.GSAVE()
5HPDF9HPDFPAGE9GRESTORE_X=PROCEDURE,- ! HPDF.HPDFPAGE.GRESTORE()
5HPDF9HPDFPAGE7CONCAT_XDDDDDD=PROCEDURE,- ! HPDF.HPDFPAGE.CONCAT(D,D,D,D,D,D)
5HPDF9HPDFPAGE7MOVETO_XDD=PROCEDURE,- ! HPDF.HPDFPAGE.MOVETO(D,D)
5HPDF9HPDFPAGE7LINETO_XDD=PROCEDURE,- ! HPDF.HPDFPAGE.LINETO(D,D)
5HPDF9HPDFPAGE8CURVETO_XDDDDDD=PROCEDURE,- ! HPDF.HPDFPAGE.CURVETO(D,D,D,D,D,D)
5HPDF9HPDFPAGE9CURVETO2_XDDDD=PROCEDURE,- ! HPDF.HPDFPAGE.CURVETO2(D,D,D,D)
5HPDF9HPDFPAGE9CURVETO3_XDDDD=PROCEDURE,- ! HPDF.HPDFPAGE.CURVETO3(D,D,D,D)
5HPDF9HPDFPAGE11CLOSEPATH_X=PROCEDURE,- ! HPDF.HPDFPAGE.CLOSEPATH()
5HPDF9HPDFPG1RCTNGLXDDDDI5CVBV2=PROCEDURE,- ! HPDF.HPDFPAGE.RECTANGLE(D,D,D,D)
5HPDF9HPDFPAGE7STROKE_X=PROCEDURE,- ! HPDF.HPDFPAGE.STROKE()
5HPDF9HPDFPG7CLSPTHSTRKX8IR41Q0=PROCEDURE,- ! HPDF.HPDFPAGE.CLOSEPATHSTROKE()
5HPDF9HPDFPAGE5FILL_X=PROCEDURE,- ! HPDF.HPDFPAGE.FILL()
5HPDF9HPDFPAGE7EOFILL_X=PROCEDURE,- ! HPDF.HPDFPAGE.EOFILL()
5HPDF9HPDFPAGE12FILLSTROKE_X=PROCEDURE,- ! HPDF.HPDFPAGE.FILLSTROKE()
5HPDF9HPDFPAGE14EOFILLSTROKE_X=PROCEDURE,- ! HPDF.HPDFPAGE.EOFILLSTROKE()
5HPDFHPDFPG1CLSPTHFLLSTR3FCSTI3=PROCEDURE,- ! HPDF.HPDFPAGE.CLOSEPATHFILLSTROKE()
5HPDFHPDFPG3CLSPTHOFLLSTL2NULG3=PROCEDURE,- ! HPDF.HPDFPAGE.CLOSEPATHEOFILLSTROKE()
5HPDF9HPDFPAGE8ENDPATH_X=PROCEDURE,- ! HPDF.HPDFPAGE.ENDPATH()
5HPDF9HPDFPAGE5CLIP_X=PROCEDURE,- ! HPDF.HPDFPAGE.CLIP()
5HPDF9HPDFPAGE7EOCLIP_X=PROCEDURE,- ! HPDF.HPDFPAGE.EOCLIP()
5HPDF9HPDFPAGE11BEGINTEXT_X=PROCEDURE,- ! HPDF.HPDFPAGE.BEGINTEXT()
5HPDF9HPDFPAGE8ENDTEXT_X=PROCEDURE,- ! HPDF.HPDFPAGE.ENDTEXT()
5HPDF9HPDFPAG4STCHRSPCXDO6SMHP1=PROCEDURE,- ! HPDF.HPDFPAGE.SETCHARSPACE(D)
5HPDF9HPDFPAG4STWRDSPCXDLRARTG1=PROCEDURE,- ! HPDF.HPDFPAGE.SETWORDSPACE(D)
5HPDFHPDFPG3STHRZNTLSCLL5GN3U40=PROCEDURE,- ! HPDF.HPDFPAGE.SETHORIZONTALSCALLING(D)
5HPDFHPDFPG6STTXTLADNGXDTC35HD0=PROCEDURE,- ! HPDF.HPDFPAGE.SETTEXTLEADING(D)
5HPDFHPDFPG6STFNTNDSZXP9VC64EQ0=PROCEDURE,- ! HPDF.HPDFPAGE.SETFONTANDSIZE(@HPDF.HPDFFONT,D)
5HPDFHPDFPG2STTXTRNDRN23EKO7IC1=PROCEDURE,- ! HPDF.HPDFPAGE.SETTEXTRENDERINGMODE($HPDF.HPDFTEXTRENDERINGMODE)
5HPDF9HPDFPAG4STTXTRISXDQNPVKN3=PROCEDURE,- ! HPDF.HPDFPAGE.SETTEXTRAISE(D)
5HPDF9HPDFPAG3MVTXTPSXDD5IIL120=PROCEDURE,- ! HPDF.HPDFPAGE.MOVETEXTPOS(D,D)
5HPDF9HPDFPAG4MVTXTPSXDD2H8B6M1=PROCEDURE,- ! HPDF.HPDFPAGE.MOVETEXTPOS2(D,D)
5HPDFHPDFPG5STTXTMTRXXDD868T452=PROCEDURE,- ! HPDF.HPDFPAGE.SETTEXTMATRIX(D,D,D,D,D,D)
5HPDF9HPDFPAGE6MVTNXTLNXBV2GHG2=PROCEDURE,- ! HPDF.HPDFPAGE.MOVETONEXTLINE()
5HPDFHPDFPGSHWTXTXSYSTMSU4ETOU2=PROCEDURE,- ! HPDF.HPDFPAGE.SHOWTEXT(@SYSTEM.STRING)
5HPDFHPDFPG8SHWTXTNXTLNX3QLVGD2=PROCEDURE,- ! HPDF.HPDFPAGE.SHOWTEXTNEXTLINE(@SYSTEM.STRING)
5HPDFHPDFPG0SHWTXTNXTLNE0S4V6I1=PROCEDURE,- ! HPDF.HPDFPAGE.SHOWTEXTNEXTLINEEX(D,D,@SYSTEM.STRING)
5HPDF9HPDFPAGE13SETGRAYFILL_XD=PROCEDURE,- ! HPDF.HPDFPAGE.SETGRAYFILL(D)
5HPDF9HPDFPG5STGRYSTRKXDHRMJJ33=PROCEDURE,- ! HPDF.HPDFPAGE.SETGRAYSTROKE(D)
5HPDFHPDFPG2STRGBFLLXDDDAROK153=PROCEDURE,- ! HPDF.HPDFPAGE.SETRGBFILL(D,D,D)
5HPDFHPDFPG4STRGBSTRKXDD08DU5O0=PROCEDURE,- ! HPDF.HPDFPAGE.SETRGBSTROKE(D,D,D)
5HPDFHPDFPG3STCMYKFLLXDDO0KBJE1=PROCEDURE,- ! HPDF.HPDFPAGE.SETCMYKFILL(D,D,D,D)
5HPDFHPDFPG5STCMYKSTRKXDGHG61G1=PROCEDURE,- ! HPDF.HPDFPAGE.SETCMYKSTROKE(D,D,D,D)
5HPDFHPDFPG6EXCTXBJCTX11EU9UI12=PROCEDURE,- ! HPDF.HPDFPAGE.EXECUTEXOBJECT(@HPDF.HPDFIMAGE)
5HPDFHPDFPG1DRWMGXP11HPD4QFJ2J0=PROCEDURE,- ! HPDF.HPDFPAGE.DRAWIMAGE(@HPDF.HPDFIMAGE,D,D,D,D)
5HPDF9HPDFPAGE7CIRCLE_XDDD=PROCEDURE,- ! HPDF.HPDFPAGE.CIRCLE(D,D,D)
5HPDF9HPDFPAGE4ARC_XDDDDD=PROCEDURE,- ! HPDF.HPDFPAGE.ARC(D,D,D,D,D)
5HPDFHPDFPGTXTUTXDDSYSTMEMA3U10=PROCEDURE,- ! HPDF.HPDFPAGE.TEXTOUT(D,D,@SYSTEM.STRING)
5HPDFHPDFPGTXTRCTXDDDD195I5Q7M0=PROCEDURE,- ! HPDF.HPDFPAGE.TEXTRECT(D,D,D,D,@SYSTEM.STRING,$HPDF.HPDFTEXTALIGNMENT,I)
5HPDFHPDFPG4STSLDSHWX21OU0VJSV2=PROCEDURE,- ! HPDF.HPDFPAGE.SETSLIDESHOW($HPDF.HPDFTRANSITIONSTYLE,D,D)
5HPDF9HPDFPAGE11GETHANDLE_I=PROCEDURE,- ! HPDF.HPDFPAGE.GETHANDLE()I
5HPDFHPDFPG9STRTPGWTHFN9H0NN4J1=PROCEDURE,- ! HPDF.HPDFPAGE.STARTPAGEWITHFONT(@HPDF.HPDFFONT,D)
5HPDFHPDFPGWRTSOSYSTMSTRC7GT621=PROCEDURE,- ! HPDF.HPDFPAGE.WRITES(@SYSTEM.STRING)I
5HPDFHPDFFNT3HPDFFNTGTFOM3A1T01=PROCEDURE,- ! HPDF.HPDFFONT.HPDF_FONT_GETFONTNAME(I)@SYSTEM.STRING
5HPDFHPDFFNT7HPDFFNTGTNO62L98B0=PROCEDURE,- ! HPDF.HPDFFONT.HPDF_FONT_GETENCODINGNAME(I)@SYSTEM.STRING
5HPDFHPDFFNT7HPDFFNTGTIICH81GV2=PROCEDURE,- ! HPDF.HPDFFONT.HPDF_FONT_GETUNICODEWIDTH(I,I)I
5HPDFHPDFFNT9HPDFFNTGTB8AR53FT2=PROCEDURE,- ! HPDF.HPDFFONT.HPDF_FONT_GETBBOX(I)$HPDF.HPDFBOX
5HPDFHPDFFNT1HPDFFNTGTSIHAP4JT3=PROCEDURE,- ! HPDF.HPDFFONT.HPDF_FONT_GETASCENT(I)I
5HPDFHPDFFNT2HPDFFNTGTDIGVVLOI3=PROCEDURE,- ! HPDF.HPDFFONT.HPDF_FONT_GETDESCENT(I)I
5HPDFHPDFFNT2HPDFFNTGTIIH2SS3R1=PROCEDURE,- ! HPDF.HPDFFONT.HPDF_FONT_GETXHEIGHT(I)I
5HPDFHPDFFNT4HPDFFNTGTIICKU1093=PROCEDURE,- ! HPDF.HPDFFONT.HPDF_FONT_GETCAPHEIGHT(I)I
5HPDFHPDFFNT1HPDFFNTT15OF654M90=PROCEDURE,- ! HPDF.HPDFFONT.HPDF_FONT_TEXTWIDTH(I,@SYSTEM.STRING,I)$HPDF.HPDFTEXTWIDTH
5HPDFHPDFFNT3HPDFFNTMAIO73UKC33=PROCEDURE,- ! HPDF.HPDFFONT.HPDF_FONT_MEASURETEXT(I,@SYSTEM.STRING,I,D,D,D,D,I,D)I
5HPDF9HPDFFONTP1_UI=PROCEDURE,- ! HPDF.HPDFFONT.HPDFFONT(I)
5HPDF9HPDFFONT11GETHANDLE_I=PROCEDURE,- ! HPDF.HPDFFONT.GETHANDLE()I
5HPDFHPDFFNT3GTFNTNMOSYSKR4RP73=PROCEDURE,- ! HPDF.HPDFFONT.GETFONTNAME()@SYSTEM.STRING
5HPDFHPDFFNT7GTNCDNGNMOSGC0T752=PROCEDURE,- ! HPDF.HPDFFONT.GETENCODINGNAME()@SYSTEM.STRING
5HPDF9HPDFFNT7GTNCDWDTHI0A1VSU1=PROCEDURE,- ! HPDF.HPDFFONT.GETUNICODEWIDTH(I)I
5HPDFHPDFFNTGTBBXSP8HPDFDFI93J2=PROCEDURE,- ! HPDF.HPDFFONT.GETBBOX()$HPDF.HPDFBOX
5HPDF9HPDFFONT11GETASCENT_I=PROCEDURE,- ! HPDF.HPDFFONT.GETASCENT()I
5HPDF9HPDFFONT12GETDESCENT_I=PROCEDURE,- ! HPDF.HPDFFONT.GETDESCENT()I
5HPDF9HPDFFONT12GETXHEIGHT_I=PROCEDURE,- ! HPDF.HPDFFONT.GETXHEIGHT()I
5HPDF9HPDFFONT14GETCAPHEIGHT_I=PROCEDURE,- ! HPDF.HPDFFONT.GETCAPHEIGHT()I
5HPDFHPDFFNT1TXTWDTHSP15OB84KJ1=PROCEDURE,- ! HPDF.HPDFFONT.TEXTWIDTH(@SYSTEM.STRING,I)$HPDF.HPDFTEXTWIDTH
5HPDFHPDFFNT3MASRTXTOSYSBCMM6S1=PROCEDURE,- ! HPDF.HPDFFONT.MEASURETEXT(@SYSTEM.STRING,I,D,D,D,D,I,D)I
5HPDF3HPDFUTLN4HPDFUTLIIJBHSUS2=PROCEDURE,- ! HPDF.HPDFOUTLINE.HPDF_OUTLINE_SETOPENED(I,I)I
5HPDF3HPDFUTLN9HPDFUTOIIAOO8PQ1=PROCEDURE,- ! HPDF.HPDFOUTLINE.HPDF_OUTLINE_SETDESTINATION(I,I)I
5HPDF13HPDFOUTLINEP1_UI=PROCEDURE,- ! HPDF.HPDFOUTLINE.HPDFOUTLINE(I)
5HPDF13HPDFOUTLN1GTHNDLI22UVFB2=PROCEDURE,- ! HPDF.HPDFOUTLINE.GETHANDLE()I
5HPDF13HPDFOUTLIN1STPNDX7B30763=PROCEDURE,- ! HPDF.HPDFOUTLINE.SETOPENED(I)
5HPDF3HPDFUTLN6STDSTO17O7ODPLB2=PROCEDURE,- ! HPDF.HPDFOUTLINE.SETDESTINATION(@HPDF.HPDFDESTINATION)
5HPDF3HPDFNCDR2HPDFNC17ID8NLJS3=PROCEDURE,- ! HPDF.HPDFENCODER.HPDF_ENCODER_GETTYPE(I)$HPDF.HPDFENCODERTYPE
5HPDF3HPDFNCDR6HPDFN14IOI1VBCN0=PROCEDURE,- ! HPDF.HPDFENCODER.HPDF_ENCODER_GETBYTETYPE(I,@SYSTEM.STRING,I)$HPDF.HPDFBYTETYPE
5HPDF3HPDFNCDR5HPDFNCIIIQBDDG70=PROCEDURE,- ! HPDF.HPDFENCODER.HPDF_ENCODER_GETUNICODE(I,I)I
5HPDF3HPDFNCDR9HPDFNC17I5EBRNU3=PROCEDURE,- ! HPDF.HPDFENCODER.HPDF_ENCODER_GETWRITINGMODE(I)$HPDF.HPDFWRITINGMODE
5HPDF13HPDFENCODERP1_UI=PROCEDURE,- ! HPDF.HPDFENCODER.HPDFENCODER(I)
5HPDF13HPDFENCDR1GTHNDLIDQD05O3=PROCEDURE,- ! HPDF.HPDFENCODER.GETHANDLE()I
5HPDF3HPDFNCDR6GTNCDRT17FDT58P3=PROCEDURE,- ! HPDF.HPDFENCODER.GETENCODERTYPE()$HPDF.HPDFENCODERTYPE
5HPDF3HPDFNCDR3GTBYTT14OBQFTVV1=PROCEDURE,- ! HPDF.HPDFENCODER.GETBYTETYPE(@SYSTEM.STRING,I)$HPDF.HPDFBYTETYPE
5HPDF13HPDFENCDR2GTNCDIIP69NBO0=PROCEDURE,- ! HPDF.HPDFENCODER.GETUNICODE(I)I
5HPDF3HPDFNCDR6GTWRTNG17I6PQVU3=PROCEDURE,- ! HPDF.HPDFENCODER.GETWRITINGMODE()$HPDF.HPDFWRITINGMODE
5HPDF7HPDFDSTNTON5HPDFOISPVNFG3=PROCEDURE,- ! HPDF.HPDFDESTINATION.HPDF_DESTINATION_SETXYZ(I,D,D,D)I
5HPDF7HPDFDSTNTON5HPDFOINA3MJG2=PROCEDURE,- ! HPDF.HPDFDESTINATION.HPDF_DESTINATION_SETFIT(I)I
5HPDF7HPDFDSTNTON6HPDFOI4IHBOM1=PROCEDURE,- ! HPDF.HPDFDESTINATION.HPDF_DESTINATION_SETFITH(I,D)I
5HPDF7HPDFDSTNTON6HPDFOINU01LE0=PROCEDURE,- ! HPDF.HPDFDESTINATION.HPDF_DESTINATION_SETFITV(I,D)I
5HPDF7HPDFDSTNTON6HPDFOIMDD4K73=PROCEDURE,- ! HPDF.HPDFDESTINATION.HPDF_DESTINATION_SETFITR(I,D,D,D,D)I
5HPDF7HPDFDSTNTON6HPDFOILAN00M1=PROCEDURE,- ! HPDF.HPDFDESTINATION.HPDF_DESTINATION_SETFITB(I)I
5HPDF7HPDFDSTNTON7HPDFOIJ8V8R53=PROCEDURE,- ! HPDF.HPDFDESTINATION.HPDF_DESTINATION_SETFITBH(I,D)I
5HPDF7HPDFDSTNTON7HPDFOI04E2MT2=PROCEDURE,- ! HPDF.HPDFDESTINATION.HPDF_DESTINATION_SETFITBV(I,D)I
5HPDF17HPDFDESTINATIONP1_UI=PROCEDURE,- ! HPDF.HPDFDESTINATION.HPDFDESTINATION(I)
5HPDF7HPDFDSTNTONSTXYZXD9MOHQN3=PROCEDURE,- ! HPDF.HPDFDESTINATION.SETXYZ(D,D,D)
5HPDF17HPDFDESTNTONSTFTXTNF1U42=PROCEDURE,- ! HPDF.HPDFDESTINATION.SETFIT()
5HPDF7HPDFDSTNTONSTFTHXD586VI22=PROCEDURE,- ! HPDF.HPDFDESTINATION.SETFITH(D)
5HPDF7HPDFDSTNTONSTFTVXDG3ISJ51=PROCEDURE,- ! HPDF.HPDFDESTINATION.SETFITV(D)
5HPDF7HPDFDSTNTONSTFTRXDU8605M0=PROCEDURE,- ! HPDF.HPDFDESTINATION.SETFITR(D,D,D,D)
5HPDF17HPDFDSTNTONSTFTBXVFLUE71=PROCEDURE,- ! HPDF.HPDFDESTINATION.SETFITB()
5HPDF7HPDFDSTNTONSTFTBHX1KJFN92=PROCEDURE,- ! HPDF.HPDFDESTINATION.SETFITBH(D)
5HPDF7HPDFDSTNTONSTFTBVXKV7CME1=PROCEDURE,- ! HPDF.HPDFDESTINATION.SETFITBV(D)
5HPDF7HPDFDSTNTON1GTHNDI6Q0OV73=PROCEDURE,- ! HPDF.HPDFDESTINATION.GETHANDLE()I
5HPDF6HPDFNNTTON7HPDII249426LG0=PROCEDURE,- ! HPDF.HPDFANNOTATION.HPDF_LINKANNOT_SETHLTMODE(I,$HPDF.HPDFANNOTHIGHLIGHTMODE)I
5HPDF6HPDFNNTTON1HPDFIIIQ1T5GE1=PROCEDURE,- ! HPDF.HPDFANNOTATION.HPDF_LINKANNOT_SETBORDERSTYLE(I,D,I,I)I
5HPDF6HPDFNNTTON4HPDFI15M91N051=PROCEDURE,- ! HPDF.HPDFANNOTATION.HPDF_TEXTANNOT_SETICON(I,$HPDF.HPDFANNOTICON)I
5HPDF6HPDFNNTTON6HPDFTII24DJK52=PROCEDURE,- ! HPDF.HPDFANNOTATION.HPDF_TEXTANNOT_SETOPENED(I,I)I
5HPDF16HPDFANNOTATIONP1_UI=PROCEDURE,- ! HPDF.HPDFANNOTATION.HPDFANNOTATION(I)
5HPDF6HPDFNNTTON1GTHNDLIGVF8V72=PROCEDURE,- ! HPDF.HPDFANNOTATION.GETHANDLE()I
5HPDF6HPDFNNTTON8STHGH24G8G95S2=PROCEDURE,- ! HPDF.HPDFANNOTATION.SETHIGHLIGHTMODE($HPDF.HPDFANNOTHIGHLIGHTMODE)
5HPDF6HPDFNNTTON6STBRDRICUVTDJ2=PROCEDURE,- ! HPDF.HPDFANNOTATION.SETBORDERSTYLE(D,I,I)
5HPDF6HPDFNNTTONSTCNXS15GSV7N12=PROCEDURE,- ! HPDF.HPDFANNOTATION.SETICON($HPDF.HPDFANNOTICON)
5HPDF16HPDFNNTTON1STPNDXO05VMK2=PROCEDURE,- ! HPDF.HPDFANNOTATION.SETOPENED(I)
5HPDF13HPDFXOBJECTP1_UI=PROCEDURE,- ! HPDF.HPDFXOBJECT.HPDFXOBJECT(I)
5HPDF13HPDFXBJCT1GTHNDLIH9R3E11=PROCEDURE,- ! HPDF.HPDFXOBJECT.GETHANDLE()I
5HPDF1HPDFMG0HPDFMGGT11I9SSF503=PROCEDURE,- ! HPDF.HPDFIMAGE.HPDF_IMAGE_GETSIZE(I)$HPDF.HPDFPOINT
5HPDF1HPDFMG1HPDFMGGTWDIENACEK0=PROCEDURE,- ! HPDF.HPDFIMAGE.HPDF_IMAGE_GETWIDTH(I)I
5HPDF1HPDFMG2HPDFMGGTHIIUIBQFA1=PROCEDURE,- ! HPDF.HPDFIMAGE.HPDF_IMAGE_GETHEIGHT(I)I
5HPDF1HPDFMG2HPDFMGGTBTI2D4L952=PROCEDURE,- ! HPDF.HPDFIMAGE.HPDF_IMAGE_GETBITSPERCOMPONENT(I)I
5HPDF1HPDFMG6HPDFMGGTCLO3MODAS3=PROCEDURE,- ! HPDF.HPDFIMAGE.HPDF_IMAGE_GETCOLORSPACE(I)@SYSTEM.STRING
5HPDF1HPDFMG5HPDFIIIIIIIRUC43Q3=PROCEDURE,- ! HPDF.HPDFIMAGE.HPDF_IMAGE_SETCOLORMASK(I,I,I,I,I,I,I)I
5HPDF1HPDFMG5HPDFMGSTMSIF1UH923=PROCEDURE,- ! HPDF.HPDFIMAGE.HPDF_IMAGE_SETMASKIMAGE(I,I)
5HPDF11HPDFIMAGEP1_UI=PROCEDURE,- ! HPDF.HPDFIMAGE.HPDFIMAGE(I)
5HPDF1HPDFMGGTSZSP11HPDI1LPBVE1=PROCEDURE,- ! HPDF.HPDFIMAGE.GETSIZE()$HPDF.HPDFPOINT
5HPDF11HPDFIMAGE9GETWIDTH_I=PROCEDURE,- ! HPDF.HPDFIMAGE.GETWIDTH()I
5HPDF11HPDFIMAGE11GETHEIGHT_I=PROCEDURE,- ! HPDF.HPDFIMAGE.GETHEIGHT()I
5HPDF1HPDFMG1GTBTSPRCMPN07I7DK2=PROCEDURE,- ! HPDF.HPDFIMAGE.GETBITSPERCOMPONENT()I
5HPDF1HPDFMG5GTCLRSPCOSYHSIJ7A1=PROCEDURE,- ! HPDF.HPDFIMAGE.GETCOLORSPACE()@SYSTEM.STRING
5HPDF1HPDFMG4STCLRMIIIIIVCN0IG0=PROCEDURE,- ! HPDF.HPDFIMAGE.SETCOLORMASK(I,I,I,I,I,I)
5HPDF11HPDFMG4STMSKMGXPPLSSDFB3=PROCEDURE,- ! HPDF.HPDFIMAGE.SETMASKIMAGE(@HPDF.HPDFIMAGE)
5HPDF5HPDFXTGSTT1HPDFXII2OFSM33=PROCEDURE,- ! HPDF.HPDFEXTGSTATE.HPDF_EXTGSTATE_SETALPHASTROKE(I,D)I
5HPDF5HPDFXTGSTT9HPDFXTI1A5QO61=PROCEDURE,- ! HPDF.HPDFEXTGSTATE.HPDF_EXTGSTATE_SETALPHAFILL(I,D)I
5HPDF5HPDFXTGSTT9HPDII15AGVQ3V0=PROCEDURE,- ! HPDF.HPDFEXTGSTATE.HPDF_EXTGSTATE_SETBLENDMODE(I,$HPDF.HPDFBLENDMODE)I
5HPDF15HPDFEXTGSTATEP1_UI=PROCEDURE,- ! HPDF.HPDFEXTGSTATE.HPDFEXTGSTATE(I)
5HPDF5HPDFXTGSTT1GTHNDLI9T0JHP0=PROCEDURE,- ! HPDF.HPDFEXTGSTATE.GETHANDLE()I
5HPDF5HPDFXTGSTT6STLPHSTOTR97L0=PROCEDURE,- ! HPDF.HPDFEXTGSTATE.SETALPHASTROKE(D)
5HPDF5HPDFXTGSTT4STLPHFL60F34S2=PROCEDURE,- ! HPDF.HPDFEXTGSTATE.SETALPHAFILL(D)
5HPDF5HPDFXTGSTT4STBLN15P41PE83=PROCEDURE,- ! HPDF.HPDFEXTGSTATE.SETBLENDMODE($HPDF.HPDFBLENDMODE)
SPARE,-
SPARE,-
SPARE,-
SPARE,-
SPARE,-
SPARE,-
SPARE,-
SPARE,-
SPARE,-
SPARE)
$ EOD
$	link/share=pdfdbl.exe pdfdbl.obj,pdfdbl.opt/opt,DBLDIR:synergy.opt/opt
$   else					! build on VAX/VMS
$	write sys$output "Not built on AXP/VMS or I64/VMS"
$	write sys$output "Not setup for building on VAX/VMS"
$   endif
$!
$! Remove the temporary files
$!
$   delete pdfdbl.obj;*
$   delete pdfdbl.opt;*
$!