@echo off
setlocal
cd /d "%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='Stop'; $parts=Get-ChildItem '.\parts\part-*.b64'|Sort-Object Name; if($parts.Count -ne 76){Write-Host ('RESULTADO=ERROR_PARTS '+$parts.Count+'/76'); exit 1}; $b64=($parts|ForEach-Object {[IO.File]::ReadAllText($_.FullName).Trim()}) -join ''; $bytes=[Convert]::FromBase64String($b64); $out=Join-Path (Get-Location) 'PrivilegeFans-FULL-SOURCE-v32.10-RC7.zip'; [IO.File]::WriteAllBytes($out,$bytes); $sha=(Get-FileHash -Algorithm SHA256 $out).Hash.ToLower(); Write-Host ('PARTS='+$parts.Count); Write-Host ('SIZE='+$bytes.Length); Write-Host ('SHA256='+$sha); if($sha -ne 'a77d46135729b72de24effe4d837868bc3f5a76bd01bfdc468e10115a635637b'){Write-Host 'RESULTADO=ERROR_SHA'; exit 1}; Write-Host 'RESULTADO=OK'; Write-Host $out"
pause
