#!/usr/bin/env bash
set -euo pipefail

REPO="${1:-.}"

if ! git -C "$REPO" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "error: not a git repository: $REPO" >&2
  exit 1
fi

mapfile -t TAGS < <(git -C "$REPO" tag --list | sort -V)

if [ "${#TAGS[@]}" -eq 0 ]; then
  echo "error: no tags found" >&2
  exit 1
fi

PS3="Select a tag number (or q to quit): "

OPTIONS=("Manual entry" "Quit")
OPTIONS+=("${TAGS[@]}")

select OPT in "${OPTIONS[@]}"; do
  case "$REPLY" in
    q|Q)
      exit 0
      ;;
  esac

  case "$OPT" in
    "Manual entry")
      read -r -p "Enter tag: " MANUAL_TAG
      if [ -z "$MANUAL_TAG" ]; then
        echo "error: empty tag" >&2
        continue
      fi
      if ! git -C "$REPO" tag --list "$MANUAL_TAG" | grep -q .; then
        echo "error: tag not found: $MANUAL_TAG" >&2
        continue
      fi
      git -C "$REPO" checkout --detach "$MANUAL_TAG"
      echo "Checked out tag: $MANUAL_TAG"
      exit 0
      ;;
    "Quit")
      exit 0
      ;;
    "")
      echo "Invalid selection" >&2
      ;;
    *)
      git -C "$REPO" checkout --detach "$OPT"
      echo "Checked out tag: $OPT"
      exit 0
      ;;
  esac
done
