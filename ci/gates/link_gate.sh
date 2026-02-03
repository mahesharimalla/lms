#!/usr/bin/env bash
set -euo pipefail

URLS=$(grep -RhoE 'https?://[^") ]+' api webapp | sort -u)

for url in $URLS; do
  if ! echo "$url" | grep -qE '^https://([a-zA-Z0-9-]+\.)*army\.mil'; then
    echo "❌ Unauthorized external link: $url"
    exit 1
  fi
done

echo "✅ External links compliant"
