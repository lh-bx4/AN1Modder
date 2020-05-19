rem Setting up
echo.
echo Setting up...
for %%f in ( null info tmp mod build aquanoxmodbuild aquanoxgatheredfiles ) do (
call if not exist ".\%%dir_%%f%%" ( md .\%%dir_%%f%% ) 
)
md ".\%dir_tmp%\%dir_aquanoxgatheredfiles%"
md ".\%dir_build%\%dir_aquanoxmodbuild%"