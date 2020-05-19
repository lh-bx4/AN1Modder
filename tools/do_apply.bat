rem Applying
choice /M "Apply Mod ?"
if "%errorlevel%"=="1" ( xcopy /e ".\%dir_build%" "%programfiles(x86)%" && if "%errorlevel%"=="1" ( call :erroradmin "Please copy files manually." "%programfiles(x86)%" ) )
exit/b

:erroradmin solution destination
echo Requires admin privileges : please %~1
start explorer.exe "%~2"
exit/b