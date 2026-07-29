@echo off
setlocal EnableExtensions
rem Remove HKCU Open-with registration created by register-md-open-with.cmd.

set "PROGID=StandAloneMD.MarkdownEditor"
set "APPKEY=HKCU\Software\Classes\Applications\open-markdown-editor.cmd"
set "PROGIDKEY=HKCU\Software\Classes\%PROGID%"

reg delete "%PROGIDKEY%" /f >nul 2>&1
reg delete "%APPKEY%" /f >nul 2>&1
reg delete "HKCU\Software\Classes\.md\OpenWithProgids" /v "%PROGID%" /f >nul 2>&1
reg delete "HKCU\Software\Classes\.markdown\OpenWithProgids" /v "%PROGID%" /f >nul 2>&1
reg delete "HKCU\Software\Classes\.md\OpenWithList\open-markdown-editor.cmd" /f >nul 2>&1
reg delete "HKCU\Software\Classes\.markdown\OpenWithList\open-markdown-editor.cmd" /f >nul 2>&1

echo Unregistered Markdown Editor ^(StandAloneMD^) Open-with entries from HKCU.
exit /b 0
