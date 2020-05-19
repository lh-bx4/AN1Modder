rem Gathering
echo. && echo Gathering aquanox0-6 files in %dir_aquanoxgatheredfiles%...
cd/d .\%dir_tmp%
:: Notice that in aquanox5 and aquanox6 are files that have the same name than some in the creating %dir_aquanoxgatheredfiles% folder. 
:: Replacing them seems to not affect the game.
for /l %%a in (0,1,6) do (
echo aquanox%%a
xcopy ".\aquanox%%a" ".\%dir_aquanoxgatheredfiles%" /e
)