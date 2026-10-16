@echo off
setlocal

set ROOT=%~dp0..
set BIFROST=%ROOT%\bifrost\bifrost.exe

echo [INFO] Iniciando stack AI local (uvx + Bifrost + LM Studio backend)

if exist "%BIFROST%" (
  echo [INFO] Iniciando Bifrost en http://127.0.0.1:8000
  start "" "%BIFROST%" --config "%ROOT%\bifrost\config.yaml"
) else (
  echo [AVISO] No se encuentra bifrost.exe en %BIFROST%
  echo [AVISO] Descarga Bifrost desde: https://github.com/maximhq/bifrost/releases
  echo [AVISO] Colócalo ahí como bifrost.exe
)

echo [INFO] Iniciando Open WebUI con uvx (http://localhost:3000)
cd /d "%ROOT%"
uvx open-webui@latest serve

endlocal
