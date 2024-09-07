@echo off
setlocal enabledelayedexpansion
for %%F in (*.mp3) do (
    set "current_file=%%F"
    set "file_name=%%~nF"
    set "folder_name=!file_name!_slices"
    if not exist "!folder_name!" mkdir "!folder_name!"
    set counter=1
    ffmpeg -i "!current_file!" -f segment -segment_time 1800 -c copy "!folder_name!\!file_name!_%%03d.mp3"
)