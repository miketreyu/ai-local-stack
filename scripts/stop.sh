#!/usr/bin/env bash
set -e

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
PIDFILE="$ROOT_DIR/bifrost/bifrost.pid"

if [ -f "$PIDFILE" ]; then
  PID="$(cat "$PIDFILE")"
  if ps -p "$PID" > /dev/null 2>&1; then
    echo "[INFO] Deteniendo Bifrost (PID $PID)"
    kill "$PID" || true
    sleep 1
    kill -9 "$PID" 2>/dev/null || true
  fi
  rm -f "$PIDFILE"
fi

echo "[INFO] Para detener Open WebUI, pulsa Ctrl+C en la terminal donde está corriendo"
