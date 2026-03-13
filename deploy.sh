#!/usr/bin/env bash
# Deploy Agent Forge landing page to thisminute.org/forge
# Served directly by nginx as static files (same pattern as /rhizome, /mainmenu).
#
# First deploy: run with --setup to create remote dir and nginx config.
# Usage: bash deploy.sh [--setup]
set -euo pipefail

INSTANCE="thisminute"
ZONE="us-central1-a"
REMOTE_DIR="/opt/forge"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# First-time setup: create dir and add nginx location block
if [[ "${1:-}" == "--setup" ]]; then
    echo "=== First-time setup ==="

    echo "[1/2] Creating remote directory..."
    gcloud compute ssh "$INSTANCE" --zone="$ZONE" --command="sudo mkdir -p $REMOTE_DIR && sudo chown -R \$(whoami) $REMOTE_DIR"

    echo "[2/2] Adding nginx location block..."
    gcloud compute ssh "$INSTANCE" --zone="$ZONE" --command="
        if ! grep -q '/forge' /etc/nginx/sites-available/thisminute; then
            sudo sed -i '/location \/static\//i\\
    # Agent Forge - multi-agent system management\\
    location /forge/ {\\
        alias /opt/forge/;\\
        index index.html;\\
        try_files \\\$uri \\\$uri/ /forge/index.html;\\
    }\\
' /etc/nginx/sites-available/thisminute
            sudo nginx -t && sudo systemctl reload nginx
            echo 'Nginx config updated.'
        else
            echo 'Nginx location block already exists.'
        fi
    "

    echo "=== Setup complete. Now run: bash deploy.sh ==="
    exit 0
fi

echo "=== Deploying Agent Forge ==="

# 1. Upload files to server
echo "[1/2] Uploading files..."
gcloud compute scp \
    "$SCRIPT_DIR/index.html" \
    "$INSTANCE:$REMOTE_DIR/" --zone="$ZONE"

# 2. Verify
echo "[2/2] Verifying..."
sleep 1
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "https://thisminute.org/forge/" 2>/dev/null || echo "failed")
echo ""
if [ "$STATUS" = "200" ]; then
    echo "=== Live at: https://thisminute.org/forge ==="
else
    echo "=== Deploy complete (HTTP $STATUS) ==="
    echo "Check: https://thisminute.org/forge"
fi
