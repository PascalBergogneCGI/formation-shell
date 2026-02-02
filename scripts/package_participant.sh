#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST_DIR="$ROOT_DIR/dist"
DATE_TAG="$(date +%Y%m%d)"
OUT_DIR="$DIST_DIR/participant-$DATE_TAG"
ZIP_NAME="$DIST_DIR/participant-$DATE_TAG.zip"
TAR_NAME="$DIST_DIR/participant-$DATE_TAG.tar.gz"

INCLUDE_SOLUTIONS=0

usage() {
  cat <<'EOF'
usage: package_participant.sh [--with-solutions]

Crée un package participant contenant guide/ et workshop/ uniquement.
- legacy/ est exclu
- solutions/ sont exclues par défaut
EOF
}

for arg in "$@"; do
  case "$arg" in
    --with-solutions) INCLUDE_SOLUTIONS=1 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Argument inconnu: $arg" >&2; usage; exit 1 ;;
  esac
done

rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"

EXCLUDES=("--exclude=./legacy" "--exclude=./.git" "--exclude=./guide/.git" "--exclude=./workshop/.git")
if [ "$INCLUDE_SOLUTIONS" -eq 0 ]; then
  EXCLUDES+=("--exclude=./workshop/solutions" "--exclude=./workshop/instructor_solutions")
fi

tar -cf - "${EXCLUDES[@]}" guide workshop | (cd "$OUT_DIR" && tar -xf -)

mkdir -p "$DIST_DIR"

if command -v zip >/dev/null 2>&1; then
  rm -f "$ZIP_NAME"
  (cd "$OUT_DIR" && zip -r "$ZIP_NAME" guide workshop >/dev/null)
  echo "Créé: $ZIP_NAME"
else
  rm -f "$TAR_NAME"
  (cd "$OUT_DIR" && tar -czf "$TAR_NAME" guide workshop)
  echo "zip absent. Créé: $TAR_NAME"
fi
