@echo off

set pname=websock_rtsp_proxy.exe

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
cd /d C:\Program Files\Streamedian\WS RTSP Proxy Server
echo "restart..."
start %pname% -install
start %pname% -start
goto repeat