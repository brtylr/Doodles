@echo off
Rem Clears command prompt for readability.

:start

Rem Req is scanned and the input is set to scanID variable.
Set /P scanID=Please scan or type requisition now.

@echo off

Rem Checks for pdf file in S:\Doctor Reqs\ with scanID name. Repeats script from start if none found.
IF NOT EXIST “S:\Doctor Reqs\%scanID%.pdf” (
	echo PDF for %scanID% not found! Batch script is set to repeat.
	pause
	goto start
)

Rem scanID.pdf is copy and pasted. /Y forces an overwrite. Error is produced if copies are not found in destination folder. Three folders are checked.
Set errorflag=0

Copy /Y S:\Doctor Reqs\%scanID%.pdf S:Doctor Reqs\Michigan Reqs\

IF NOT EXIST “S:\Doctor Reqs\Michigan Reqs\%scanID%.pdf” (
	echo %scanID% not found in Michigan Reqs!
	set errorflag=1
) ELSE (
	echo %scanID% copied to Michigan Reqs.
)

Copy /Y S:\Doctor Reqs\%scanID%.pdf S:Doctor Reqs\Phillips Reqs\

IF NOT EXIST “S:\Doctor Reqs\Phillips Reqs\%scanID%.pdf” (
	echo %scanID% not found in Doctor Reqs!
	set errorflag=1
) ELSE (
	echo %scanID% copied to Doctor Reqs.
)

Copy /Y S:\Doctor Reqs\%scanID%.pdf S:Doctor Reqs\IntelliPath PDF Requisitions\

IF NOT EXIST “S:\Doctor Reqs\IntelliPath PDF Requisitions\%scanID%.pdf” (
	echo %scanID% not found in IntelliPath PDF Requisitions!
	set errorflag=1
) ELSE (
	echo %scanID% copied to IntelliPath PDF Reqs.
)

IF errorflag==1 (
	pause
)

Rem Opens scanID pdf file in C:\Program Files (x86)\Adobe\Acrobat Reader\Reader\AcroRd32.exe
Start “” “S:\Doctor Reqs\%scanID%.pdf”

Goto start
