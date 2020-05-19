@echo off
color f0
title Aquanox Unpaker
setlocal enabledelayedexpansion

call .\tools\set_params.bat "%~dp0"

cd/d %param_cd%
call .\tools\do_setup.bat

if "%param_do_copy%"=="1" (
title Aquanox Unpaker - Copy
cd/d %param_cd%
call .\tools\do_copy.bat
) else ( echo Copy skiped >> .\info\%txt_log% )

if "%param_do_extract%"=="1" (
title Aquanox Unpaker - Extract
cd/d %param_cd%
call .\tools\do_extraction.bat
) else ( echo Extratcion skiped >> .\info\%txt_log% )

if "%param_do_gather%"=="1" (
title Aquanox Unpaker - Gather
cd/d %param_cd%
call .\tools\do_gathering.bat
) else ( echo Gathering skiped >> .\info\%txt_log% )

if "%param_do_build%"=="1" (
title Aquanox Unpaker - Build
cd/d %param_cd%
call .\tools\do_build.bat
) else ( echo Building skiped >> .\info\%txt_log% )

if "%param_do_decompile%"=="1" (
title Aquanox Unpaker - Decompile
cd/d %param_cd%
call .\tools\do_decompile.bat
) else ( echo Decompilation skiped >> .\info\%txt_log% )

if "%param_do_apply%"=="1" (
title Aquanox Unpaker - Apply
cd/d %param_cd%
call .\tools\do_apply.bat
) else ( echo Apply skiped >> .\info\%txt_log% )

echo.
echo Finished.
echo Remeber to check variables.txt
pause>nul
exit

:: todo
:: create "auto" and "manual" mod in each tool
:: improve log saving
:: apply 10 second to auto-choose for prompts
:: rearrange : build then decompile in .\tmp and then create folder mod with editor to easily apply modified files.
:: improve the ct=rash check for cdes.exe
