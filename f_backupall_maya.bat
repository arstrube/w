:: Copy files to backup drive, overwrite only if newer.
 echo off
 echo.
 echo B A C K I N G   U P   N E W E R   F I L E S
 echo ===========================================
 echo Working...
 setlocal enabledelayedexpansion
 set cdrv=%cd:~0,2%
 ::
 set source=C:\_dev
 set target=%cdrv%\BACKUP\_dev
 echo.&echo "%source%" to "%target%"
 xcopy "%source%" "%target%" /r /i /s /h /d /y
 ::
 set source=C:\eclipse
 set target=%cdrv%\BACKUP\eclipse
 echo.&echo "%source%" to "%target%"
 xcopy "%source%" "%target%" /r /i /s /h /d /y
 ::
 set source=C:\MinGW
 set target=%cdrv%\BACKUP\MinGW
 echo.&echo "%source%" to "%target%"
 xcopy "%source%" "%target%" /r /i /s /h /d /y
 ::
 set source=C:\Program Files
 set target=%cdrv%\BACKUP\Program Files
 echo.&echo "%source%" to "%target%"
 xcopy "%source%" "%target%" /r /i /s /h /d /y
 ::
 set source=C:\Program Files (x86)
 set target=%cdrv%\BACKUP\Program Files (x86)
 echo.&echo "%source%" to "%target%"
 xcopy "%source%" "%target%" /r /i /s /h /d /y
 ::
 for %%a in (.android,AppData,Contacts,Documents,Favorites,Music,Pictures,Program Files ^(x86^),Videos) do (
   for %%b in (Arnd,Public) do (
     set source=C:\Users\%%b\%%a
     set target=%cdrv%\BACKUP\Users\%%b\%%a
     echo.&echo "!source!" to "!target!"
     xcopy "!source!" "!target!" /r /i /s /h /d /y
   )
 )
 ::
 for /d %%a in (C:\W-DRIVE*) do (
   set source=%%a
   set target=%cdrv%\BACKUP\%%~na
   echo.&echo "!source!" to "!target!"
   xcopy "!source!" "!target!" /r /i /s /h /d /y
 )
 ::
 set source=Q:\
 set target=%cdrv%\BACKUP\Q
 echo.&echo "%source%" to "%target%"
 xcopy "%source%" "%target%" /r /i /s /h /d /y
 ::
 pause
 