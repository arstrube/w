:: Copy files to backup drive, overwrite only if newer.
 @echo off
 echo.
 echo B A C K I N G   U P   W - D R I V E
 echo ===================================
 echo Working...
 set cdrv=%cd:~0,2%
 set target=C:\W-DRIVE
 set source=%cdrv%\
 echo.&echo "%source%" to "%target%"
 xcopy "%source%" "%target%" /r /i /s /h /d /y
 pause
 