The following demo programs test various aspects of the libharu interface.

Build pdfdbl first:
	On Windows:
		build_pdfdbl.bat
	    or
		dblproto pdfdbl.dbl
		dbl pdfdbl.dbl
		dblink -l pdfdbl.elb pdfdbl.dbo
	On Windows .NET:
		build_pdfdbl_net32.bat
	    or
		build_pdfdbl_net64.bat
	    or
		dblnet -target=dll -target=x86 pdfdbl.dbl
	    or
		dblnet -target=dll -target=x64 pdfdbl.dbl
	on VMS:
		@build_pdfdbl.com
	On Unix:
		sh build_pdfdbl.sh
	    or
		dblproto pdfdbl.dbl
		dbl pdfdbl.dbl
		dblink -l pdfdbl.elb pdfdbl.dbo

Build each demo program separately.  Note that some programs require data
files to run.  Remember to set SYNIMPDIR to the location of the dbp files
created from pdfdbl.dbl above.

On Windows:
	Before running the Synergy exectuables in the demo directories 
	place the files in Windows32 or Windows64 (or both) in the system path.

	Batch files for building each demo program are provided in each of the
	demo directories.  The batch files assume that pdfdbl.dll and pdfdbl.dbp
	or pdfdbl.elb are in the current directory.  The batch files can be
	edited to specify the path to these files or copy the files into the
	local directory before running the batch files.

On Unix:
	Before running the Synergy executables in the demo directories
	place the libhpdf.so or libhpdf64.so into the shared library path.

On VMS:
	Before linking or running the Synergy executables in the demo
	directories, logicals need to be set to the executable and path for
	each of the two shared images: pdfdbl.exe and libhpdf.exe.

For example:
	On Windows:
		build_Encryption.bat
	    or
		dbl Encryption
		dblink Encryption pdfdbl.elb
	On Windows .NET:
		build_Encryption_net32.bat
	    or
		build_Encryption_net64.bat
	    or
		dblnet -ref=pdfdbl.dll -platform=x86 Encryption
	    or
		dblnet -ref=pdfdbl.dll -platform=x64 Encryption
	On Unix:
		sh build_Encryption.sh
	    or
		dbl Encryption
		dblink Encryption pdfdbl.elb
	On VMS:
		$ define pdfdbl PDFDBL_PATH:pdfdbl.exe
		$ define libhpdf LIBHPDF_PATH:libhpdf.exe
		$ @build_Encryption.com
	    or
		$ define pdfdbl PDFDBL_PATH:pdfdbl.exe
		$ define libhpdf LIBHPDF_PATH:libhpdf.exe
		$ dbl Encryption
		$ link Encryption,sys$input:/opt
		$ DECK
		CLUSTER = SYNERGY$$CODE
		COLLECT = SYNERGY$$CODE,$DBLTRNSF_CODE,$CODE$
		CLUSTER = SYNERGY$$READONLY
		COLLECT = SYNERGY$$READONLY,$DBG$,$DBL_ADDR,$DBL_CODE,$DBL_LINCTL,$DBL_LITERAL
		SYS$SHARE:DBLTLIB/LIB
		PDFDBL/SHARE
		SYS$SHARE:SYNRTL/SHARE
		$ EOD

The demo programs:
	Encryption/Encryption.dbl
	FontDemo/FontDemo.dbl
	ImageDemo/ImageDemo.dbl
		basn0g01.png
		basn3p02.png
		maskimage.png
	LineDemo/LineDemo.dbl
	OutlineDemo/OutlineDemo.dbl
	Permission/Permission.dbl
	RawImageDemo/RawImageDemo.dbl
		32_32_gray.dat
		32_32_rgb.dat
	SlideShowDemo/SlideShowDemo.dbl
	TextDemo/TextDemo.dbl
	simplepdf/simplepdf.dbl
		gray.jpg
