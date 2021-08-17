# PDFKit15f<br />
**Created Date:** 10/16/2015<br />
**Last Updated:** 2/10/2020<br />
**Description:** This is an API based on the "libHaru"; library at libharu.org.<br />
**Platforms:** Windows; Unix; OpenVMS<br />
**Products:** Synergy DBL<br />
**Minimum Version:** 10.1.1<br />
**Author:** Synergex Developer
<hr>

**Additional Information:** The API is currently supported on Windows, UNIX, and OpenVMS. We have tested the API with Synergy/DE 9.3 (traditional)and higher and 9.5.1a (.NET), 10.3.1/9.5.3b (VMS) and higher. Note: pdfkit15f contains an updated version of the pdfdbl.dbl file. Do not compile with CPU setting as ANY CPU.
Directory Structure:

AIX32		AIX 32-bit shared library
AIX64		AIX 64-bit shared library
HPUX_IT64	HPUX Itanium 64-bit shared library
HPUX32		HPUX 32-bit shared library
HPUX64		HPUX 64-bit shared library
LINUX32		Linux 32-bit shared library
LINUX64		Linux 64-bit shared library
SCO		SCO 32-bit shared library
SOLARIS_X64	Solaris X64 64-bit shared library
SOLARIS32	Solaris 32-bit shared library
SOLARIS64	Solaris 64-bit shared library
Tru64		Tru64 64-bit shared library
VMS_AXP		AXP/VMS shared images
VMS_I64		I64/VMS shared images
Windows32	Windows XP onwards 32-bit dlls
Windows64	Windows XP onwards 64-bit dlls

pdfdbl.dbl	        Interface to dll/sharedlibrary works with all O/S and .NET
build_pdfdbl.bat	Windows batch file to prototype, build pdfdbl.elb
build_pdfdbl_net32.bat	Windows .NET batch file to prototype, build pdfdbl.dll for 32-bit .NET
build_pdfdbl_net64.bat	Windows .NET batch file to prototype, build pdfdbl.dll for 64-bit .NET
build_pdfdbl.sh		Unix shell script to prototype, build pdfdbl.elb
build_pdfdbl.com	VMS command file to prototype, build pdfdbl.exe

doc\doc		Libharu html documentation - start with documentation.html
		The documentation has links to example and demo programs which
		are not included here. See http://libharu.org for more
		information.

README		This file

hpdf_error.def	The file with the libharu error number definitions.

Using_HaruPdf.txt	Helpful information using the PDF API.

if\Synergy	Synergy Example programs

The PDF API is dependent on MSVCR100.DLL and it needs to be in the path.
Try looking for it in C:\Windows\System32\ or C:\Windows\SysWOW64\
