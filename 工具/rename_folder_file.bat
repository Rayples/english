@echo off
setlocal enabledelayedexpansion

rem ����Ҫ������ļ���·�������Ը���ʵ������޸�
set "folderPath=C:\Users\Ray\gitee\english\��ЧӢ������"

rem �����ļ�����
pushd "%folderPath%"
for /d %%D in (*) do (
    set "oldFolderName=%%D"
    set "newFolderName=!oldFolderName:��=(!
    set "newFolderName=!newFolderName:��=)!
    if not "!oldFolderName!"=="!newFolderName!" (
        ren "!oldFolderName!" "!newFolderName!"
    )
)
popd

rem �����ļ���
for /r "%folderPath%" %%F in (*) do (
    set "fileName=%%~nF"
    set "extension=%%~xF"
    set "newFileName=!fileName:��=(!
    set "newFileName=!newFileName:��=)!
    if not "!fileName!"=="!newFileName!" (
        ren "%%F" "!newFileName!!extension!"
    )
)