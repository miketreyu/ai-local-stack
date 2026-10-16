# ai-local-stack

Stack portable 100% local para usar LLMs con interfaz WebUI + gateway Bifrost.

## Componentes
- [LM Studio](https://lmstudio.ai/) – Backend (llama.cpp) que carga tus `.gguf` desde disco externo
- [Bifrost](https://github.com/maximhq/bifrost) – Gateway OpenAI-compatible para enrutar entre modelos
- [Open WebUI](https://github.com/open-webui/open-webui) – Interfaz web tipo ChatGPT
- Ejecutado con [uvx](https://docs.astral.sh/uv/) – Sin Docker necesario

## Estructura
```
ai-local-stack/
├── bifrost/config.yaml
├── scripts/start.sh / stop.sh / start.bat / stop.bat
├── webui/README.md
└── models/README.md  # Aquí van tus .gguf (NO se suben al repo)
```

## Preparación (una sola vez por PC)
1. LM Studio: activa API Server en `http://127.0.0.1:1234/v1`
2. Bifrost: descarga binario desde [releases](https://github.com/maximhq/bifrost/releases). Para Linux guarda como `bifrost/bifrost` (+x). Para Windows guarda como `bifrost/bifrost.exe`
3. uv: instala [uv](https://docs.astral.sh/uv/getting-started/installation/) (o `pipx`)

## Uso
- Linux: `./scripts/start.sh`
- Windows: `scripts\start.bat`

Abre http://localhost:3000 (Open WebUI) y conéctalo a `http://localhost:8000/v1` (Bifrost).

Modelos disponibles por alias:
- `general` / `qwen8b` → Qwen3-8B-Instruct-2507
- `coder` / `codigo` → Qwen2.5-Coder-7B-Instruct
- `lite` / `ligero` / `portable` → Qwen3-4B-Instruct-2507

## Notas
- Todo local (127.0.0.1). No expone nada a red.
- Modelos NO incluidos. Colócalos en `models/` (ver `models/README.md`)
- Bifrost binario NO incluido (multiplataforma)
