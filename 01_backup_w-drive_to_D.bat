:: Copy files to backup drive, overwrite only if newer.
 @echo off
 setlocal enabledelayedexpansion
 echo.
 echo B A C K I N G   U P   W - D R I V E
 echo ===================================
 echo Working...
 set root=d:\dat
 set cdrv=%cd:~0,2%
 for /f "usebackq" %%a in (`dir * /b /on /ad`) do call :do_copy "%%a" /s
 call :do_copy .
 pause
 endlocal
 exit /b
 
 :do_copy
    setlocal enabledelayedexpansion
    set target=!root!\W-DRIVE%~np1
    set source=!cdrv!%~np1
    echo.&echo "!source!" to "!target!"
    xcopy "!source!" "!target!" /r /i %2 /h /d /y /exclude:%~dpn0.txt
    echo.
 endlocal & exit /b