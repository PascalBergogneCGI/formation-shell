#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "usage: tag_step.sh stepXX" >&2
  exit 1
fi

TAG="$1"

git tag -a "$TAG" -m "$TAG complete"

echo "Tag créé: $TAG"
