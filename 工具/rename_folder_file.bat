@echo off
setlocal enabledelayedexpansion

rem 设置要处理的文件夹路径，可以根据实际情况修改
set "folderPath=C:\Users\Ray\gitee\english\高效英语听力"

rem 处理文件夹名
pushd "%folderPath%"
for /d %%D in (*) do (
    set "oldFolderName=%%D"
    set "newFolderName=!oldFolderName:（=(!
    set "newFolderName=!newFolderName:）=)!
    if not "!oldFolderName!"=="!newFolderName!" (
        ren "!oldFolderName!" "!newFolderName!"
    )
)
popd

rem 处理文件名
for /r "%folderPath%" %%F in (*) do (
    set "fileName=%%~nF"
    set "extension=%%~xF"
    set "newFileName=!fileName:（=(!
    set "newFileName=!newFileName:）=)!
    if not "!fileName!"=="!newFileName!" (
        ren "%%F" "!newFileName!!extension!"
    )
)