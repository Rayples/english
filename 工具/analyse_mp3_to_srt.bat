@echo off
setlocal enabledelayedexpansion

set "whisper_exe=E:\����Ƶ����\����\Whisper-Faster\whisper-faster.exe"
set "mp3_folder=E:\����Ƶ����\��ЧӢ������\��Ч������Ӣ�Z ��������ƪ��_slices"
echo "%mp3_folder%"
for %%F in ("%mp3_folder%\*.mp3") do (
    set "filename=%%~nF"
    "%whisper_exe%" "%%F" --model small --language en --output_format srt > "!filename!.srt"
)