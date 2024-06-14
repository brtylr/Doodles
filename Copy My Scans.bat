Rem Clears command prompt for readability.
@echo off
cls

:start


Rem Req is scanned and the input is set to scanID variable.
Set /P scanID=Please scan or type requisition now.

Set pathmain="S:\Doctor Reqs"
cls

Rem Checks for pdf file in S:\Doctor Reqs\ with scanID name. Repeats script from start if none found.
IF NOT EXIST %pathmain%\%scanID%.pdf (
	echo PDF for %scanID% not found! Batch script is set to repeat.
	pause
	cls
	goto start
)

Rem scanID.pdf is copy and pasted. /Y forces an overwrite. Error is produced if copies are not found in destination folder. Three folders are checked.
Set errorflag=0


Set subpath1="Michigan Reqs"
Copy /Y %pathmain%\%scanID%.pdf %pathmain%\%subpath1%\

IF NOT EXIST %pathmain%\%subpath1%\%scanID%.pdf (
	echo %scanID% not found in Michigan Reqs!
	set errorflag=1
) ELSE (
	echo %scanID% copied to Michigan Reqs.
)

Set subpath2="Phillips Reqs"
Copy /Y %pathmain%\%scanID%.pdf %pathmain%\%subpath2%\

IF NOT EXIST %pathmain%\%subpath2%\%scanID%.pdf (
	echo %scanID% not found in Doctor Reqs!
	set errorflag=1
) ELSE (
	echo %scanID% copied to Doctor Reqs.
)

Set subpath3="IntelliPath PDF Requisitions"
Copy /Y %pathmain%\%scanID%.pdf %pathmain%\%subpath3%\

IF NOT EXIST %pathmain%\%subpath3%\%scanID%.pdf (
	echo %scanID% not found in IntelliPath PDF Requisitions!
	set errorflag=1
) ELSE (
	echo %scanID% copied to IntelliPath PDF Reqs.
)

IF errorflag==1 (
	pause
)

Rem Opens scanID pdf file in C:\Program Files (x86)\Adobe\Acrobat Reader\Reader\AcroRd32.exe
Start %pathmain%\%scanID%.pdf

Goto start
