:: Check whether any files on C:\W-DRIVE are newer than on W:.
 @echo off
 setlocal enabledelayedexpansion
 echo.
 echo C H E C K I N G   W :   V S   C : \ W - D R I V E
 echo =================================================
 echo Working...
 set cdrv=%cd:~0,2%
 for /f "usebackq" %%a in (`dir * /b /on /ad`) do call :do_check "%%a" /s
 call :do_check .
 pause
 endlocal
 exit /b
 
 :do_check
    setlocal enabledelayedexpansion
    set source=C:\W-DRIVE%~np1
    set target=!cdrv!%~np1
    if "!source!"=="C:\W-DRIVE\" set source=C:\W-DRIVE
    echo.&echo "!source!" vs "!target!"
    xcopy "!source!" "!target!" /l /r /i %2 /h /d /y /exclude:%~dp0\backup_w-drive_to_C.txt
    echo.
 endlocal & exit /b