@echo off
move "C:\HWID Bypass\STEP 2 - Change Drive IDs\_\Volumeid.exe" "C:\" >nul
move "C:\HWID Bypass\STEP 2 - Change Drive IDs\_\Volumeid64.exe" "C:\" >nul
@echo Volume ID Files were moved to C: drive
@Echo Off
Setlocal EnableDelayedExpansion
Set _RNDLength=4
Set _Alphanumeric=0123456789ABCDEF
Set _Str=%_Alphanumeric%987654321
:_LenLoop
IF NOT "%_Str:~18%"=="" SET _Str=%_Str:~9%& SET /A _Len+=9& GOTO :_LenLoop
SET _tmp=%_Str:~9,1%
SET /A _Len=_Len+_tmp
Set _count=0
SET _RndAlphaNum=
:_loop
Set /a _count+=1
SET _RND=%Random%
Set /A _RND=_RND%%%_Len%
SET _RNDZ=%Random%
Set /A _RNDZ=_RNDZ%%%_Len%
SET _RndAlphaNum=!_RndAlphaNum!!_Alphanumeric:~%_RND%,1!
SET _RndAlphaNumz=!_RndAlphaNumz!!_Alphanumeric:~%_RNDZ%,1!
If !_count! lss %_RNDLength% goto _loop
@echo off
fsutil fsinfo drives
@echo ----------------------------------------------------------------------------------------------------------------
@echo ----------------------------------------------------------------------------------------------------------------
set drive=C
cd c:\
vol %drive%:
@echo COPY THE SERIAL VOLUME NUMBER ABOVE SOMEWHERE
@echo Drive %drive% id will be changed to !_RndAlphaNum!-!_RndAlphaNumz!
@echo Press any key to continue:
C:\Windows\security\Volumeid.exe %drive%: !_RndAlphaNum!-!_RndAlphaNumz!
@echo Drive %drive% id was successfully changed to !_RndAlphaNum!-!_RndAlphaNumz!
timeout /T 3 >nul
exit
