#!/usr/bin/env bash
set -euo pipefail

echo "🔍 Hygiene check"

grep -RIn "TODO\|FIXME\|console.log" api webapp && {
  echo "❌ Hygiene violation"
  exit 1
}

find . -name "*.env" -not -path "./node_modules/*" | grep . && {
  echo "❌ .env file committed"
  exit 1
}

echo "✅ Hygiene OK"
