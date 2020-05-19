rem Copying
echo.
echo Copying...
for /l %%A in (0,1,6) do (
if not exist ".\%dir_tmp%\aquanox%%A.pak" ( 
echo Copiying aquanox%%A.pak to .\%dir_tmp% 
copy "%programfiles(x86)%\Aquanox\dat\pak\aquanox%%A.pak" ".\%dir_tmp%\"
)
)