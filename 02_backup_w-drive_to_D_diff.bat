:: Copy files to backup drive, overwrite only if newer.
:: Copy target is W-DRIVE-DIFF. 
:: Copy only files not contained in W-DRIVE.
 @echo off
 setlocal enabledelayedexpansion
 echo.
 echo B A C K I N G   U P   D I F F   O F   W - D R I V E
 echo ===================================================
 echo Working...&echo.
 set root=d:\dat
 set cdrv=%cd:~0,2%
 for /f "usebackq" %%a in (`dir * /b /on /ad`) do call :do_diff "%%a" /s & call :do_copy "%%a" /s
 call :do_diff . & call :do_copy .
 del C:\TEMP\%~n0.txt
 del /q %root%\W-DRIVE-DIFF\W-TEMP
 pause
 endlocal
 
 :do_diff
    setlocal enabledelayedexpansion
    set target=!root!\W-DRIVE%~np1
    set source=!cdrv!%~np1
    rem echo.&echo Diff "!source!"
    xcopy "!source!" "!target!" /r /i %2 /h /u /y /l >C:\TEMP\%~n0.txt
 endlocal & exit /b
 
 :do_copy
    setlocal enabledelayedexpansion
    set target=!root!\W-DRIVE-DIFF%~np1
    set source=!cdrv!%~np1
    echo "!source!" to "!target!"
    xcopy "!source!" "!target!" /r /i %2 /h /d /y /exclude:C:\TEMP\%~n0.txt
    echo.
 endlocal & exit /b