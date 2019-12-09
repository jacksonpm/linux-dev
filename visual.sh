echo Instalando Plank

sudo add-apt-repository ppa:ricotz/docky -y && sudo apt-get update && sudo apt-get install plank -y
sudo add-apt-repository ppa:docky-core/stable
sudo apt-get update
sudo apt-get install plank

clear
sudo apt install gnome-tweaks
sudo apt remove gnome-shell-extension-ubuntu-dock
sudo apt install vanilla-gnome-desktop
