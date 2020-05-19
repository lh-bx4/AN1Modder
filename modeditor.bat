@echo off
chcp 65001>nul
color 0c
title Ʌquanox ɱod ϝiles ɇditor
setlocal enabledelayedexpansion
call .\tools\set_params.bat "%~dp0">nul
start explorer.exe .\%dir_tmp%

:menuloop
cls
call :dispalymenu
choice /c icearm /n /m ">>>"
if "%errorlevel%"=="1" ( call :modfile )
if "%errorlevel%"=="2" ( .\info\filelist.docx )
if "%errorlevel%"=="3" ( exit )
if "%errorlevel%"=="4" ( call :apply )
if "%errorlevel%"=="5" ( call "%programfiles(x86)%\%dir_aquanoxmodbuild%\Aqua_cheat_launcher.bat" "%programfiles(x86)%\%dir_aquanoxmodbuild%" )
if "%errorlevel%"=="6" ( call :musicedit )
goto :menuloop

:dispalymenu
::width is 23 so far
for %%a in ("Input a file ··········" "Music file rename ·····" "Apply files to build ··" "Check list of extension" "Run the game (cheat) ··" "Exit ··················") do (
echo \\\ %%~a ///
echo /// ^^˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ \\\
echo.
)
exit/b

:modfile
call set/p "file=Drag a file to mod it : "
echo /!\ Remeber to check the integrity of the file.
call :pastetomod %file%
call :open "%modfile%">nul

goto :jumperror1
:: this part doesn't work correctly
choice /c yn /m "Is the file corrupted ?"
if "%errorlevel%"=="1" (
call set errorlevel=0
choice /c yn /m "Please confirme your choice : Y"
if "%errorlevel%"=="1" (
echo Confirmed. You declared this file as 'corrupted'
echo /!\ This file wont work.
echo %modfile%>>.\%dir_info%\corrupted_list.txt
choice /c yn /m "Keep it in .\%dir_mod% ?"
if "%errorlevel%"=="1" (
echo You choosed to keep the file. Remeber you can edit the corrupted_list.txt in .\%dir_info% 
)
if "%errorlevel%"=="2" (
echo Aborted. File is no longer in .\%dir_mod%
del "%modfile%"
set "modfile=corrupted~%modfile%"
)
)
if "%errorlevel%"=="2" (
echo Aborted. You declared this file as 'not corrupted' 
)
)
if "%errorlevel%"=="2" (
echo Aborted. You declared this file as 'not corrupted' 
)
:jumperror1

echo %modfile%>>.\%dir_info%\modfilelog.txt
choice /t 10 /c x /d x /m "Wait 10 seconds or press [x]" /n
exit/b

:pastetomod file
set filename=%~n1
set fileext=%~x1
set "abspath=%~dp1"
call set outputfolder=%%abspath:%param_cd%%dir_tmp%\%dir_aquanoxgatheredfiles%~%fileext:~1,3%=.\%dir_mod%%%
::call set outputfolder=%%outputfolder:%dir_tmp%=mod%%
echo xcopy "%~1" "%outputfolder%"
pause
xcopy "%~1" "%outputfolder%"
set "modfile=%outputfolder%%~nx1"
exit/b

:open file
:: write here the file you doesn't want to automatically open
for %%a in ( .mp3 ) do (
if "%~x1"=="%%a" ( exit/b )
)
"%~1">nul
exit/b

:apply
echo /!\ Some files are badly decompiled and may causes the game to crash.
echo /!\ However, an error box will tell you which file is laggy
echo /!\ Applying modded files is reversible. Just delete them.
choice /m "Are you sure to apply files to Aquanox_Mod ?" /c yn /t 10 /d y
if "%errorlevel%"=="1" ( 
if exist "%programfiles(x86)%\%dir_aquanoxmodbuild%\" (
xcopy ".\mod\" "%programfiles(x86)%\%dir_aquanoxmodbuild%\"
if "%errorlevel%"=="1" (
echo Requires admin privileges. Copy the files yourself.
start explorer.exe ".\mod" && start explorer.exe "%programfiles(x86)%"
) else ( echo Done. ) 
) else ( echo Error : "%programfiles(x86)%\%dir_aquanoxmodbuild%\" doesn't exist. Please run automated.bat )
)
if "%errorlevel%"=="2" ( echo Skiped. )
choice /t 10 /c x /d x /m "Wait 10 seconds or press [x]" /n
exit/b

:musicedit
:: could be automated
echo /!\ Requires to have import music files
:jump1
set/p "offmusic=Drag official Aquanox music file : "
call :checkmp3 %offmusic% 1

:jump2
set/p "newmusic=Drag your new music file : "
call :checkmp3 %newmusic% 2

call :musicapply %offmusic% %newmusic%
exit/b

:checkmp3 file jump
if "%~x1" neq ".mp3" ( echo File needs to be in .mp3 && goto :jump%~2 )
exit/b

:musicapply official new
xcopy "%~2" "%~dp1"
del "%~1"
ren "%~dp1%~nx2" "%~nx1%
exit/b

:: todo
:: add folder input
:: add music renamer