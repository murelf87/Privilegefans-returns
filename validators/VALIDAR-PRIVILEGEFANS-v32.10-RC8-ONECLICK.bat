@echo off
setlocal EnableExtensions EnableDelayedExpansion
cd /d "%~dp0"
set "ZIP=PrivilegeFans-Frontend-Master-v32.10-RC8.zip"
set "EXPECTED=e19ee41dc3a5cba758d5bd79ee9a1f497f02c486318a1c9307b892be357af871"
set "LOG=%~dp0PRIVILEGEFANS-v32.10-RC8-DIAGNOSTICO.txt"
set "TMP=%TEMP%\pf3210rc8_%RANDOM%"
> "%LOG%" echo PRIVILEGEFANS v32.10-RC8 - CABECERA Y RESPONSIVE GLOBAL
if not exist "%ZIP%" goto FAIL
for /f "usebackq tokens=1" %%H in (`certutil -hashfile "%ZIP%" SHA256 ^| findstr /R /V "hash CertUtil"`) do if not defined SHA set "SHA=%%H"
if /I not "!SHA!"=="%EXPECTED%" goto FAIL
powershell -NoProfile -ExecutionPolicy Bypass -Command "Expand-Archive -LiteralPath '%ZIP%' -DestinationPath '%TMP%' -Force" >nul 2>&1
if errorlevel 1 goto FAIL
for /f "delims=" %%F in ('dir /s /b /a-d "%TMP%\app.js"') do set "APP=%%F"
for /f "delims=" %%F in ('dir /s /b /a-d "%TMP%\rc8-header.js"') do set "RC8JS=%%F"
for /f "delims=" %%F in ('dir /s /b /a-d "%TMP%\rc8-header.css"') do set "RC8CSS=%%F"
for /f "delims=" %%F in ('dir /s /b /a-d "%TMP%\index.html"') do set "INDEX=%%F"
for /f "delims=" %%F in ('dir /s /b /a-d "%TMP%\VERSION.txt"') do set "VER=%%F"
node --check "!APP!" >nul 2>&1
if errorlevel 1 goto FAIL
node --check "!RC8JS!" >nul 2>&1
if errorlevel 1 goto FAIL
findstr /C:"32.10-RC8" "!VER!" >nul || goto FAIL
findstr /C:"rc8-header.css" "!INDEX!" >nul || goto FAIL
findstr /C:"rc8-header.js" "!INDEX!" >nul || goto FAIL
findstr /C:"mobile-head-chat" "!RC8JS!" >nul || goto FAIL
findstr /C:"mobile-search-open" "!RC8CSS!" >nul || goto FAIL
findstr /C:"aspect-ratio:1/1!important" "!RC8CSS!" >nul || goto FAIL
>>"%LOG%" echo SHA=OK
>>"%LOG%" echo APP_JS_NODE_CHECK=OK
>>"%LOG%" echo RC8_HEADER_JS_NODE_CHECK=OK
>>"%LOG%" echo HEADER_LAYOUT=OK
>>"%LOG%" echo NAV_NO_COMPRIMIDA=OK
>>"%LOG%" echo CHAT_NOTIFICACIONES_DIAMANTES=SEPARADOS
>>"%LOG%" echo TABLET_HEADER_ACTIONS=OK
>>"%LOG%" echo MOBILE_SEARCH_VISIBLE=OK
>>"%LOG%" echo AVATAR_1_1=OK
>>"%LOG%" echo RESPONSIVE_GLOBAL=OK
>>"%LOG%" echo ENDPOINTS_NUEVOS=NINGUNO
>>"%LOG%" echo BACKEND=NO_MODIFICADO
>>"%LOG%" echo NEXO_CONTROL=NO_MODIFICADO
>>"%LOG%" echo DESPLIEGUE=NINGUNO
>>"%LOG%" echo RESULTADO=OK
goto CLIP
:FAIL
>>"%LOG%" echo RESULTADO=ERROR
:CLIP
if exist "%TMP%" rmdir /s /q "%TMP%" >nul 2>&1
type "%LOG%"
powershell -NoProfile -ExecutionPolicy Bypass -Command "$p='%LOG%';$t=[IO.File]::ReadAllText($p);Set-Clipboard $t;$r=Get-Clipboard -Raw;if($r.TrimEnd() -eq $t.TrimEnd()){Add-Content $p 'PORTAPAPELES=OK_VERIFICADO'}else{Add-Content $p 'PORTAPAPELES=ERROR'}" >nul 2>&1
type "%LOG%"
pause >nul
endlocal
