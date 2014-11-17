:: Copy files to backup drive, overwrite only if newer.
 @echo off
 echo.
 echo R E S T O R I N G   N E W E R   F I L E S
 echo =========================================
 echo Working...
 set cdrv=%cd:~0,2%
 set target=C:\E-DRIVE
 set source=%cdrv%\E-DRIVE
 echo.&echo "%source%" to "%target%"
 xcopy "%source%" "%target%" /r /i /s /h /d /y
 pause
 