@echo off
setlocal EnableExtensions
rem Launch StandAloneMD in Edge/Chrome application mode.
rem Double-clicked .md paths (%%1) are ignored — the HTML app cannot read them from the CLI.
rem Open files inside the editor with Ctrl+O (or toolbar Open).

set "HTML=%~dp0markdown-editor.html"
if not exist "%HTML%" (
  echo ERROR: markdown-editor.html not found next to this script:
  echo   %HTML%
  exit /b 1
)

rem file:/// URL with forward slashes
set "FILEURL=file:///%HTML:\=/%"

set "BROWSER="
if exist "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" set "BROWSER=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
if exist "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe" set "BROWSER=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"
if not defined BROWSER if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" set "BROWSER=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if not defined BROWSER if exist "%LocalAppData%\Google\Chrome\Application\chrome.exe" set "BROWSER=%LocalAppData%\Google\Chrome\Application\chrome.exe"
if not defined BROWSER if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" set "BROWSER=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"

if not defined BROWSER (
  echo ERROR: Neither Microsoft Edge nor Google Chrome was found.
  echo Install Edge or Chrome, or open markdown-editor.html in a browser manually.
  exit /b 1
)

start "" "%BROWSER%" --app="%FILEURL%"
exit /b 0
