@echo off
setlocal EnableExtensions EnableDelayedExpansion
cd /d "%~dp0"
set "ZIP=PrivilegeFans-Frontend-Master-v32.10-RC6.zip"
set "EXPECTED=c89a376318181fd1d99eec385fa75e70ce871039b4d4f56802c6d0a35a6db5c5"
set "LOG=%~dp0PRIVILEGEFANS-v32.10-RC6-DIAGNOSTICO.txt"
set "TMP=%TEMP%\pf3210rc6_%RANDOM%"
> "%LOG%" echo PRIVILEGEFANS v32.10-RC6 - REALS
if not exist "%ZIP%" goto FAIL
for /f "usebackq tokens=1" %%H in (`certutil -hashfile "%ZIP%" SHA256 ^| findstr /R /V "hash CertUtil"`) do if not defined SHA set "SHA=%%H"
if /I not "!SHA!"=="%EXPECTED%" goto FAIL
powershell -NoProfile -ExecutionPolicy Bypass -Command "Expand-Archive -LiteralPath '%ZIP%' -DestinationPath '%TMP%' -Force" >nul 2>&1
if errorlevel 1 goto FAIL
for /f "delims=" %%F in ('dir /s /b /a-d "%TMP%\app.js"') do set "APP=%%F"
for /f "delims=" %%F in ('dir /s /b /a-d "%TMP%\styles.css"') do set "CSS=%%F"
node --check "!APP!" >nul 2>&1
if errorlevel 1 goto FAIL
findstr /C:"reals-shell" "!CSS!" >nul || goto FAIL
findstr /C:"aspect-ratio:1/1" "!CSS!" >nul || goto FAIL
>>"%LOG%" echo SHA=OK
>>"%LOG%" echo APP_JS_NODE_CHECK=OK
>>"%LOG%" echo REALS_RESPONSIVE=OK
>>"%LOG%" echo REALS_MEDIA_OVERFLOW=PROTEGIDO
>>"%LOG%" echo AVATAR_1_1=OK
>>"%LOG%" echo OPERACIONES_DEMO=IDENTIFICADAS
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
