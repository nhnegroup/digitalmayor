@echo off

set pname=nginx_sm_ws_rtsp.exe

:repeat
Timeout 10 > NUL

rem @tasklist | find "%pname%" /c > NUL
wmic process list brief | find /i "%pname%"
IF %ErrorLevel%==1 goto 1
IF NOT %ErrorLevel%==1 goto 0

:0
echo "running..."
goto repeat

:1
cd /d C:\Users\Public\Documents\Streamedian\WS RTSP Player\nginx
echo "restart..."
start %pname%
goto repeat