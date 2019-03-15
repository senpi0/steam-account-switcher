@echo off

title Steam Account Switcher

:start
color 03
echo Checking Steam Client status...
tasklist /FI "IMAGENAME eq Steam.exe"|find ":" >nul 
IF ERRORLEVEL 1 (
  echo The Steam Client needs to be closed. Continuing will terminate any running Steam Client process.
  timeout -1
  "C:\Program Files (x86)\Steam\steam.exe" -shutdown
  taskkill /F /T /IM Steam.exe
  echo Closing Steam Client...
)

tasklist /FI "IMAGENAME eq Steam.exe"|find ":" >nul 
IF ERRORLEVEL 0 (
   echo No running Steam Client service found, proceeding...
)

echo Welcome
echo.
echo ****************************************
echo   1:  name1                     
echo   2:  name2                     
echo   3:  name3                     
echo   4:  name4                     
echo   5:  name5                     
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
set username=USERNAME
reg add "HKCU\Software\Valve\Steam" /v AutoLoginUser /t REG_SZ /d %username% /f
reg add "HKCU\Software\Valve\Steam" /v RememberPassword /t REG_DWORD /d 1 /f
start steam://open/main
goto end


:choice2
set username=USERNAME
reg add "HKCU\Software\Valve\Steam" /v AutoLoginUser /t REG_SZ /d %username% /f
reg add "HKCU\Software\Valve\Steam" /v RememberPassword /t REG_DWORD /d 1 /f
start steam://open/main
goto end


:choice3
set username=USERNAME
reg add "HKCU\Software\Valve\Steam" /v AutoLoginUser /t REG_SZ /d %username% /f
reg add "HKCU\Software\Valve\Steam" /v RememberPassword /t REG_DWORD /d 1 /f
start steam://open/main
goto end


:choice4
set username=USERNAME
reg add "HKCU\Software\Valve\Steam" /v AutoLoginUser /t REG_SZ /d %username% /f
reg add "HKCU\Software\Valve\Steam" /v RememberPassword /t REG_DWORD /d 1 /f
start steam://open/main
goto end


:choice5
set username=USERNAME
reg add "HKCU\Software\Valve\Steam" /v AutoLoginUser /t REG_SZ /d %username% /f
reg add "HKCU\Software\Valve\Steam" /v RememberPassword /t REG_DWORD /d 1 /f
start steam://open/main
goto end

:choice0
echo Cancelled
goto end



:end
exit