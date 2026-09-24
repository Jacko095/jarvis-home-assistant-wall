#!/usr/bin/env bash
# One-shot helper to install the MCP proxy and remind you of the next steps.
set -euo pipefail

echo "Installing mcp-proxy..."
uv tool install git+https://github.com/sparfenyuk/mcp-proxy

echo
echo "Done. Next steps:"
echo "1. Copy config/config.json to ~/.config/jarvis/config.json"
echo "2. Replace YOUR_HA_HOST and YOUR_LONG_LIVED_TOKEN"
echo "3. Restart Jarvis"
echo "4. Follow docs/wall-panel-guide.md for the iPad"
