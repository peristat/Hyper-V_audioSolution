@echo off
title FFplay Audio Receiver
:loop
"C:\Users\lenovo\AppData\Local\Microsoft\WinGet\Packages\Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-8.0.1-full_build\bin\ffplay.exe" -nodisp -fflags nobuffer -flags low_delay -i udp://0.0.0.0:18181?listen=1"
echo Connection lost. Restarting...
goto loop