:: Copy files to from _dev to W:, overwrite only if newer.
 @echo off
 setlocal enabledelayedexpansion
 echo.
 echo C O P Y I N G   T O   C : \ _ d e v
 echo ===================================
 echo Working...
 set cdrv=%cd:~0,2%
 for /f "usebackq" %%a in (`dir * /b /on /ad`) do call :do_copy "%%a" /s
 call :do_copy .
 pause
 endlocal
 exit /b
 
 :do_copy
    setlocal enabledelayedexpansion
    set target=C:\_dev%~np1
    set target=%target:02_ARND_STRUBE\08_SWE\=%
    set target=%target:02_ARND_STRUBE\08_SWE=%
    set source=!cdrv!%~np1
    echo.&echo "!source!" to "!target!"
rem    xcopy "!source!" "!target!" /r /i %2 /h /d /y /exclude:%~dpn0_exclude.txt
    echo.
 endlocal & exit /b