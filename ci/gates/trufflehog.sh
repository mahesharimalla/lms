#!/usr/bin/env bash
set -euo pipefail

echo "🔍 Gate-0B: TruffleHog Verified Secrets Scan"

REPORT_DIR="security-reports/trufflehog"
REPORT_FILE="$REPORT_DIR/trufflehog-report.json"

mkdir -p "$REPORT_DIR"

# TruffleHog returns exit 0 even with findings → must parse JSON
set +e
trufflehog filesystem . \
  --only-verified \
  --no-update \
  --exclude-paths .git,node_modules,dist,build,target,coverage,security-reports \
  --json > "$REPORT_FILE"
set -e

FINDINGS=$(jq 'length' "$REPORT_FILE" 2>/dev/null || echo 0)

if [ "$FINDINGS" -gt 0 ]; then
  echo "❌ TruffleHog detected $FINDINGS VERIFIED secrets"
  exit 1
fi

echo "✅ TruffleHog PASSED – No verified secrets found"
