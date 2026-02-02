#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

fail() {
  echo "ERROR: $1" >&2
  exit 1
}

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || fail "Missing command: $1"
}

need_cmd bash
need_cmd git
need_cmd awk
need_cmd sed
need_cmd grep
need_cmd find

cd "$ROOT_DIR"

git submodule update --init --recursive

# Simple sanity checks
[ -d guide ] || fail "Missing guide/ submodule"
[ -d workshop ] || fail "Missing workshop/ submodule"

if [ ! -d legacy ]; then
  fail "Missing legacy/ (internal sources)"
fi

echo "Bootstrap OK"
