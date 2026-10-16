#!/usr/bin/env bash
set -e

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
BIFROST_BIN="$ROOT_DIR/bifrost/bifrost"

echo "[INFO] Iniciando stack AI local (uvx + Bifrost + LM Studio backend)"

# Lanzar Bifrost en background si existe binario
if [ -x "$BIFROST_BIN" ]; then
  echo "[INFO] Iniciando Bifrost en http://127.0.0.1:8000"
  "$BIFROST_BIN" --config "$ROOT_DIR/bifrost/config.yaml" > "$ROOT_DIR/bifrost/bifrost.log" 2>&1 &
  echo $! > "$ROOT_DIR/bifrost/bifrost.pid"
else
  echo "[AVISO] No se encuentra bifrost binario ejecutable en $BIFROST_BIN"
  echo "[AVISO] Descarga Bifrost desde: https://github.com/maximhq/bifrost/releases"
  echo "[AVISO] Colócalo ahí con permisos +x (Linux) o bifrost.exe (Windows)"
fi

# Lanzar Open WebUI con uvx
echo "[INFO] Iniciando Open WebUI con uvx (http://localhost:3000)"
cd "$ROOT_DIR"
uvx open-webui@latest serve
