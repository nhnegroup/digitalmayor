@echo off
SETLOCAL EnableExtensions
set EXE=nginx_sm_ws_rtsp.exe
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% goto FOUND
echo Now, running...
cd .\nginx\
start "" ".\%EXE%"
goto FINISH
:FOUND
echo Already running
:FINISH

rem timeout /t 1 /nobreak > NUL

start "" http://127.0.0.1:8088/