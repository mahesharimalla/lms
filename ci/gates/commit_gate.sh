#!/usr/bin/env bash
set -e

COMMITS=$(git log origin/dev..HEAD --pretty=%s)

echo "$COMMITS" | grep -Ev '^(feat|fix|chore|docs|security)(\(.+\))?:' && {
  echo "❌ Commit standard violated"
  exit 1
}

echo "✅ Commit messages OK"
