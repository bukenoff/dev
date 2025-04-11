#!/bin/bash

current_path=pwd
cd ~/.config

read -p "Back up your configs? (Y/N): " confirm

if [[ "$confirm" =~ ^[yY](es)?$ ]]; then
  timestamp=$(date +%F_%T)
  backup_folder_name="backup-${timestamp}"
  mkdir backup_folder_name 

  echo "Backing up existing configs"

  test -d "gitui" && mv $backup_folder_name || echo "No gutui config found"
  test -d "wezterm" && mv $backup_folder_name || echo "No wezterm config found"
  test -d "tmux" && mv $backup_folder_name || echo "No tmux config found"
  test -d "nvim" && mv $backup_folder_name || echo "No nvim config found"
  test -d "kitty" && mv $backup_folder_name || echo "No kitty config found"
else
  echo "Deleting existing configs"

  test -d "gitui" && rm -rf "gitui" || echo "No gutui config found"
  test -d "wezterm" && rm -rf "wezterm" || echo "No wezterm config found"
  test -d "tmux" && rm -rf "tmux" || echo "No tmux config found"
  test -d "nvim" && rm -rf "nvim" || echo "No nvim config found"
  test -d "kitty" && rm -rf "kitty" || echo "No kitty config found"
fi

# Symlink configs to ~/.config folder
ln -s "${current_path}/gitui" gitui
ln -s "${current_path}/wezterm" wezterm 
ln -s "${current_path}/tmux" tmux 
ln -s "${current_path}/nvim" nvim 
ln -s "${current_path}/kitty" kitty 
