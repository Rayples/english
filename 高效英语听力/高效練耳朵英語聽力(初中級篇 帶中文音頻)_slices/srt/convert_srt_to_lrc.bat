@echo off
setlocal enabledelayedexpansion

for %%f in (*.srt) do (
    set "input_file=%%f"
    set "output_file=%%~nf.lrc"
	
	if exist "!output_file!" (
        del "!output_file!"
    )
	
	for /f "delims=" %%a in ('type "!input_file!"') do (
		set "line=%%a"
        if "!line:~0,1!"=="[" (
			if "!line:~10,5!"==" --> " (
				set "start_time=!line:~1,9!"
                set "end_time=!line:~15,9!"
				set "new_line=[!start_time!]!line:~26!"
                rem set "new_line=[!start_time!][!end_time!]!line:~26!"
                echo !new_line! >> "!output_file!"
			)
        ) else (
           rem echo "不是要转换的格式，直接忽略" "!line!"
        )
	)
)