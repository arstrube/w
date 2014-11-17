:: Copy files to backup drive, overwrite only if newer.
 @echo off
 setlocal enabledelayedexpansion
 echo.
 echo B A C K I N G   U P   A L L   O F   W - D R I V E
 echo =================================================
 echo Working...
 set cdrv=%cd:~0,2%
 for /f "usebackq" %%a in (`dir * /b /on /ad`) do call :do_copy "%%a" /s
 call :do_copy .
 pause
 endlocal
 
 :do_copy
    setlocal enabledelayedexpansion
    set target=C:\W-DRIVE-ALL%~np1
    set source=!cdrv!%~np1
    echo.&echo "!source!" to "!target!"
    xcopy "!source!" "!target!" /r /i %2 /h /d /y
    echo.
 endlocal & exit /b