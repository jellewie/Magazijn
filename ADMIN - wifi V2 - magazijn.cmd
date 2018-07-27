rem save this file as "wifitogglename.cmd" and run as ADMIN if it trows errors
@netsh wlan set hostednetwork mode=allow ssid=Magazijn key=Magazijn
@netsh wlan start hostednetwork
@echo off
echo ========================================================
echo = to share your current internet connecting though this hotspot
echo = Goto "Control Panel\Network and Internet\Network Connections"
echo = or in dutch "Configuratiescherm\Netwerk en internet\Netwerkverbindingen"
echo = right click the one where the internet comes from
echo = Settings \ shareing and enable these options
echo ========================================================
echo = Commands to start wifi have been executed 
echo = you can now close this window if you want
echo ========================================================
setlocal
:PROMPT
SET /P AREYOUSURE= Want to STOP the wifi (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "y" GOTO END
	netsh wlan stop hostednetwork
pause
:END
echo ========================================================
echo = here is some more information
echo ========================================================
	netsh wlan show hosted
pause
endlocal