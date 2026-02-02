#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

fail() {
  echo "ERREUR: $1" >&2
  exit 1
}

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || fail "Commande manquante: $1"
}

need_cmd bash
need_cmd git
need_cmd awk
need_cmd sed
need_cmd grep
need_cmd find

cd "$ROOT_DIR"

git submodule update --init --recursive

[ -d guide ] || fail "Submodule guide manquant"
[ -d workshop ] || fail "Submodule workshop manquant"
[ -d legacy ] || fail "Dossier legacy manquant"

echo "Bootstrap OK"
