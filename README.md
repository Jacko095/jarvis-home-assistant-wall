# Jarvis Home Assistant Wall Panel

Ready-to-use setup for running Jarvis on a wall-mounted iPad (or iPhone) as a permanent smart-home control surface.

This repo packages the official isair/jarvis desktop app with Home Assistant MCP integration and iPad kiosk instructions.

## What you get

- Voice + text chat with Jarvis
- Full control of Home Assistant entities (lights, locks, scenes, sensors, etc.)
- Wall-panel mode via Guided Access (locks the iPad into the app)
- Local-first: everything runs on your hardware, no cloud required for core functions

## Prerequisites

1. A running Home Assistant instance (any install type).
2. The isair/jarvis desktop app installed on a Mac, Windows, or Linux machine that stays on your network.
3. Ollama (or another local LLM server) on that machine.
4. A wall-mounted iPad (any recent model works; A11/A12+ recommended for smooth UI).

## 1. Home Assistant MCP setup

1. In Home Assistant go to **Settings → Devices & services → Add integration**.
2. Search for **Model Context Protocol Server** and add it.
3. Go to **Settings → Voice assistants → Exposed entities** and expose only the entities you want Jarvis to control.
4. Create a long-lived access token: click your profile (bottom left) → **Security → Create token**. Copy it.

## 2. Install the MCP proxy on the Jarvis host

```bash
uv tool install git+https://github.com/sparfenyuk/mcp-proxy
```

## 3. Jarvis config

Copy `config/config.json` into `~/.config/jarvis/config.json` (or merge the `mcps` block into your existing config) and replace the placeholders:

- `YOUR_HA_HOST` → your Home Assistant IP or hostname (e.g. `192.168.1.50`)
- `YOUR_LONG_LIVED_TOKEN` → the token from step 1

Restart Jarvis. You should now be able to say:

> "Jarvis, turn on the living room lights"
> "Jarvis, what's the temperature in the bedroom?"
> "Jarvis, run the good night scene"

## 4. Wall iPad setup

1. Install the Jarvis desktop app on your host machine (it stays running 24/7).
2. On the iPad, open Safari and go to the Jarvis chat interface if exposed, **or** use the companion chat window mirrored via a remote-desktop / screen-sharing solution of your choice.
3. Add the page to the Home Screen (Share → Add to Home Screen) so it runs full-screen like a native app.
4. Enable **Guided Access**: Settings → Accessibility → Guided Access → turn on, set a passcode.
5. Open the Jarvis interface, triple-click the side button, start the session. The iPad is now locked into Jarvis.
6. Mount it with a powered wall dock.

> Note: isair/jarvis currently has no native iOS app (see upstream issue #17). This setup uses the desktop app + a kiosk/web approach. A dedicated mobile client is tracked in the companion repo `jarvis-ha-mobile`.

## 5. Chatbot behaviour

Jarvis already supports both voice and text chat. The text chat shares the same memory and tools, so you can type questions, ask for summaries, or control devices without speaking.

## Troubleshooting

- **No tools available**: check the MCP proxy is installed and the token is valid. Look at Jarvis Logs.
- **iPad won't stay on the app**: Guided Access passcode must be set before starting the session.
- **Slow responses**: use a smaller model (e.g. `gemma4:e2b`) or enable Low Power Mode in Jarvis Settings.

## Links

- Upstream Jarvis: https://github.com/isair/jarvis
- Home Assistant MCP docs: https://www.home-assistant.io/integrations/mcp_server/
- Companion mobile repo: https://github.com/Jacko095/jarvis-ha-mobile
