rem Building
echo. && echo Creating %dir_aquanoxmodbuild%...
echo .pak>.\%dir_build%\excludelist.txt
xcopy "%programfiles(x86)%\Aquanox" ".\%dir_build%\%dir_aquanoxmodbuild%" /e /exclude:%dir_build%\excludelist.txt
rmdir/s/q .\%dir_build%\%dir_aquanoxmodbuild%\dat\pak
xcopy ".\%dir_tmp%\%dir_aquanoxgatheredfiles%" ".\%dir_build%\%dir_aquanoxmodbuild%" /e /-y
del .\%dir_build%\excludelist.txt

rem Adding cheat ;)
echo if "%%~1" neq "" ( cd/d "%%~1" ) >>.\%dir_build%\%dir_aquanoxmodbuild%\Aqua_cheat_launcher.bat
echo echo [F7]  : Toggle invicibility >>.\%dir_build%\%dir_aquanoxmodbuild%\Aqua_cheat_launcher.bat
echo echo [F8]  : Toggle invisibility >>.\%dir_build%\%dir_aquanoxmodbuild%\Aqua_cheat_launcher.bat
echo echo [F9]  : Annihilate locked target >>.\%dir_build%\%dir_aquanoxmodbuild%\Aqua_cheat_launcher.bat
echo echo [F10] : Sucess mission >>.\%dir_build%\%dir_aquanoxmodbuild%\Aqua_cheat_launcher.bat
echo echo [F11] : Mission Complete MANUAL (?) >>.\%dir_build%\%dir_aquanoxmodbuild%\Aqua_cheat_launcher.bat
echo echo [F12] : Fail mission >>.\%dir_build%\%dir_aquanoxmodbuild%\Aqua_cheat_launcher.bat
echo choice /t 5 /c x /d x /m "Launch in 5 seconds" /n >>.\%dir_build%\%dir_aquanoxmodbuild%\Aqua_cheat_launcher.bat
echo .\Aqua.exe -redrum -stendek >>.\%dir_build%\%dir_aquanoxmodbuild%\Aqua_cheat_launcher.bat
echo pause^nul >>.\%dir_build%\%dir_aquanoxmodbuild%\Aqua_cheat_launcher.bat