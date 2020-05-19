rem Decompiling
:: Requires the build to be done
echo. && echo Decompiling files...

:: These are all the file's extensions aquanox uses:
:: asi col bik bin dat dll boa bop bor des dds exe flt fog m3d mp3 msh msb osd sam sco tga tse txt wav

for %%b in ( des dds mp3 msh osd tga wav ) do (
if not exist .\%dir_tmp%\%dir_aquanoxgatheredfiles%~%%b (
md ".\%dir_tmp%\%dir_aquanoxgatheredfiles%~%%b"
robocopy ".\%dir_build%\%dir_aquanoxmodbuild%" ".\%dir_tmp%\%dir_aquanoxgatheredfiles%~%%b" *.%%b /s>nul
)
)

:: These are all the ~compiled file's extensions aquanox uses:
:: des osd msh sam

for %%b in ( des osd msh) do (
dir /a-d /s/b ".\%dir_tmp%\%dir_aquanoxgatheredfiles%~%%b">.\%dir_tmp%\%dir_aquanoxgatheredfiles%~%%b.txt
for /f "tokens=*" %%f in (%dir_tmp%\%dir_aquanoxgatheredfiles%~%%b.txt) do ( 
call :decompiling "%%f" "%%b"
)
del .\%dir_tmp%\%dir_aquanoxgatheredfiles%~%%b.txt
)
exit/b

:decompiling file folderext
set filename=%~n1
if "%filename:~-1,1%" neq "~" ( exit/b )
set "abspath=%~dp1"
call set outputfolder=%%abspath:%cd%=.%%
echo Decompiling %~nx1
.\tools\cdes.exe -dh "%~1" "%outputfolder%%filename:~0,-1%%~x1"
call :checkintegrity "%~1" "%outputfolder%%filename:~0,-1%%~x1"
:skip
exit/b

:checkintegrity src dst
if "%~z2" neq "0" ( del "%~1" ) else ( if "%~z1" == "0" ( del "%~1" ) else ( echo error with %~nx1 >>".\mod\error_aquanox$~.txt" && goto :skip ) )
exit/b