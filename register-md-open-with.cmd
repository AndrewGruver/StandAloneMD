@echo off
setlocal EnableExtensions
rem Register this repo's launcher under HKCU so .md files offer
rem "Markdown Editor (StandAloneMD)" in Explorer Open with / defaults UI.
rem No admin elevation. Does not make the editor the default handler.

set "LAUNCHER=%~dp0open-markdown-editor.cmd"
if not exist "%LAUNCHER%" (
  echo ERROR: open-markdown-editor.cmd not found:
  echo   %LAUNCHER%
  exit /b 1
)

set "PROGID=StandAloneMD.MarkdownEditor"
set "APPKEY=HKCU\Software\Classes\Applications\open-markdown-editor.cmd"
set "PROGIDKEY=HKCU\Software\Classes\%PROGID%"

rem ProgID (friendly name + open command)
reg add "%PROGIDKEY%" /ve /d "Markdown Editor (StandAloneMD)" /f >nul
reg add "%PROGIDKEY%\DefaultIcon" /ve /d "%%SystemRoot%%\System32\imageres.dll,-102" /f >nul
reg add "%PROGIDKEY%\shell\open\command" /ve /d "\"%LAUNCHER%\" \"%%1\"" /f >nul

rem Applications\*.cmd entry (shows under Open with → Choose another app)
reg add "%APPKEY%" /ve /d "Markdown Editor (StandAloneMD)" /f >nul
reg add "%APPKEY%\shell\open\command" /ve /d "\"%LAUNCHER%\" \"%%1\"" /f >nul

rem Offer for .md and .markdown (OpenWithProgids + OpenWithList)
reg add "HKCU\Software\Classes\.md\OpenWithProgids" /v "%PROGID%" /t REG_NONE /f >nul
reg add "HKCU\Software\Classes\.markdown\OpenWithProgids" /v "%PROGID%" /t REG_NONE /f >nul
reg add "HKCU\Software\Classes\.md\OpenWithList\open-markdown-editor.cmd" /ve /f >nul
reg add "HKCU\Software\Classes\.markdown\OpenWithList\open-markdown-editor.cmd" /ve /f >nul

echo Registered: Markdown Editor ^(StandAloneMD^)
echo Launcher:   %LAUNCHER%
echo.
echo Next steps:
echo   1. Right-click a .md file → Open with → choose "Markdown Editor (StandAloneMD)"
echo   2. Or Settings → Apps → Default apps → .md → pick it if listed
echo.
echo Limitation: the editor opens empty; use Ctrl+O inside the app to load the file.
echo To remove: run unregister-md-open-with.cmd
exit /b 0
