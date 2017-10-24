@echo off
setlocal enabledelayedexpansion
for /f "delims=  tokens=1" %%i in ('netstat -aon ^| findstr "8000"') do (
    set a=%%i
    goto job
)
:job
taskkill /F /pid "!a:~71,5!"
pelican content
cd output
start cmd /c "python -m pelican.server 8000"
cd ..