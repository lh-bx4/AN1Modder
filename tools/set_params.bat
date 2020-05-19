echo Header
for /f "tokens=*" %%f in (variables.txt) do ( 
if "%%f"==".end" ( echo. && goto :eof ) else ( call echo "%%~f" && call set "%%~f" )
)