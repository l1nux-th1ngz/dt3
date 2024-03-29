#!/bin/bash

# Install Terminator, Rofi, and Polybar
sudo apt-get update
sudo apt-get install -y terminator rofi polybar

# Create Polybar config directory and copy config file
polybar_config_dir="$HOME/.config/polybar"
mkdir -p "$polybar_config_dir"
cp /usr/share/doc/polybar/config "$polybar_config_dir/config"

# Create Rofi config directory and copy config file
rofi_config_dir="$HOME/.config/rofi"
mkdir -p "$rofi_config_dir"
cp /usr/share/doc/rofi/config.rasi "$rofi_config_dir/config.rasi"

# Set up keyboard shortcuts
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['<Primary>Return']"
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "'terminator'"
gsettings set org.gnome.settings-daemon.plugins.media-keys kitty "'<Primary>t'"

# Set up Polybar autostart
autostart_dir="$HOME/.config/autostart"
mkdir -p "$autostart_dir"
echo -e "[Desktop Entry]\nType=Application\nExec=bash -c 'polybar --config=$polybar_config_dir/config main'\nHidden=false\nNoDisplay=false\nX-GNOME-Autostart-enabled=true\nName[en_US]=Polybar\nName=Polybar" > "$autostart_dir/polybar.desktop"

# Display a message for further instructions
echo "Installation completed successfully."
echo "Please log out and log in again to apply the changes. If the Rofi shortcut still doesn't work, try using a different key combination."
