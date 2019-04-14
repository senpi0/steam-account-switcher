@echo off

title Steam Account Switcher


rem Replace 'username#' with the desired Steam Account Username.
rem Make sure that the path set at line #16 is the right path for your 'Steam.exe'. The preset path is set to the default Steam installation path.


:info
set usr1=username1
set usr2=username2
set usr3=username3
set usr4=username4
set usr5=username5
set steampath=C:\Program Files (x86)\Steam\steam.exe

:start
color 09
echo Checking Steam Client status...
tasklist /FI "IMAGENAME eq Steam.exe"|find ":" >nul 
IF ERRORLEVEL 1 (
  echo The Steam Client needs to be closed. Continuing will terminate any running Steam Client process. 
  timeout -1
  "%steampath%" -shutdown
  taskkill /F /T /IM Steam.exe
  echo Closing Steam Client...
)

tasklist /FI "IMAGENAME eq Steam.exe"|find ":" >nul 
IF ERRORLEVEL 0 (
   echo No running Steam Client service found, proceeding...
)

rem Here you can replace the '%usr#%' with any name you want, it's just for display purposes and won't affect the functional part of the script.
echo Welcome
echo.
echo ****************************************
echo   1:  %usr1%
echo   2:  %usr2%
echo   3:  %usr3%
echo   4:  %usr4%
echo   5:  %usr5%
echo   0:  cancel
echo ****************************************
echo.



echo Select which user you want by typing it's assigned number below: 
set /p choice=User:  
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto :choice1
if '%choice%'=='2' goto :choice2
if '%choice%'=='3' goto :choice3
if '%choice%'=='4' goto :choice4
if '%choice%'=='5' goto :choice5
if '%choice%'=='0' goto :choice0
echo "%choice%" is not a valid option. Please try again.
echo.
goto start


:choice1
reg add "HKCU\Software\Valve\Steam" /v AutoLoginUser /t REG_SZ /d %usr1% /f
reg add "HKCU\Software\Valve\Steam" /v RememberPassword /t REG_DWORD /d 1 /f
start steam://open/main
goto end


:choice2
reg add "HKCU\Software\Valve\Steam" /v AutoLoginUser /t REG_SZ /d %usr2% /f
reg add "HKCU\Software\Valve\Steam" /v RememberPassword /t REG_DWORD /d 1 /f
start steam://open/main
goto end


:choice3
reg add "HKCU\Software\Valve\Steam" /v AutoLoginUser /t REG_SZ /d %usr3% /f
reg add "HKCU\Software\Valve\Steam" /v RememberPassword /t REG_DWORD /d 1 /f
start steam://open/main
goto end


:choice4
reg add "HKCU\Software\Valve\Steam" /v AutoLoginUser /t REG_SZ /d %usr4% /f
reg add "HKCU\Software\Valve\Steam" /v RememberPassword /t REG_DWORD /d 1 /f
start steam://open/main
goto end


:choice5
reg add "HKCU\Software\Valve\Steam" /v AutoLoginUser /t REG_SZ /d %usr5% /f
reg add "HKCU\Software\Valve\Steam" /v RememberPassword /t REG_DWORD /d 1 /f
start steam://open/main
goto end

:choice0
echo Cancelled
goto end



:end
exit