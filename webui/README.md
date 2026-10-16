# Open WebUI con uvx

Usaremos `uvx` para lanzar Open WebUI sin crear venv manual ni Docker.

Requisitos:
- Python 3.11+ instalado
- [uv](https://docs.astral.sh/uv/getting-started/installation/) instalado (o usar `pipx`)

Arranque rápido (desde scripts/):
- Linux: `scripts/start.sh`
- Windows: `scripts/start.bat`

O manual:
```bash
uvx open-webui@latest serve
```

Después abre: http://localhost:3000 (o el puerto que muestre).

Conecta Open WebUI a Bifrost en: http://localhost:8000/v1 (OpenAI-compatible)
