#!/bin/bash
CONFIGS=(gitui wezterm tmux nvim kitty)
REPO_DIR="$(dirname "$0")"

for config in "${CONFIGS[@]}"; do
  src="${REPO_DIR}/${config}"
  dest="${HOME}/.config/${config}"

  if [[ ! -d "$src" ]]; then
    echo "Warning: ${config} not found in repo, skipping"
    continue
  fi

  if [[ -d "$dest" ]]; then
    rm -rf "$dest"
  fi

  cp -r "$src" "$dest"
  echo "Copied ${config}"
done

echo "Done"
