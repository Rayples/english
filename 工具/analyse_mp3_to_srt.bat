@echo off
setlocal enabledelayedexpansion

set "whisper_exe=E:\音视频处理\工具\Whisper-Faster\whisper-faster.exe"
set "mp3_folder=E:\音视频处理\高效英语听力\高效練耳朵英語聽力（初級篇）_slices"
echo "%mp3_folder%"
for %%F in ("%mp3_folder%\*.mp3") do (
    set "filename=%%~nF"
    "%whisper_exe%" "%%F" --model small --language en --output_format srt > "!filename!.srt"
)