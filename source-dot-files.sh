#!/bin/bash

current_path=pwd
cd ~/.config

# Back up your current configs, just in case
timestamp=$(date +%F_%T)
backup_folder_name="backup-${timestamp}"

mkdir backup_folder_name 
test -d "gitui" && mv $backup_folder_name || echo "No gutui config found"
test -d "wezterm" && mv $backup_folder_name || echo "No wezterm config found"
test -d "tmux" && mv $backup_folder_name || echo "No tmux config found"
test -d "nvim" && mv $backup_folder_name || echo "No nvim config found"
test -d "kitty" && mv $backup_folder_name || echo "No kitty config found"

# Symlink configs to ~/.config folder
ln -s "${current_path}/gitui" gitui
ln -s "${current_path}/wezterm" wezterm 
ln -s "${current_path}/tmux" tmux 
ln -s "${current_path}/nvim" nvim 
ln -s "${current_path}/kitty" kitty 
