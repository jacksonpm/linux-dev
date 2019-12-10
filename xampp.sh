wget https://ufpr.dl.sourceforge.net/project/xampp/XAMPP%20Linux/7.0.8/xampp-linux-7.0.8-0-installer.run -O xampp-installer.run
wget "https://ufpr.dl.sourceforge.net/project/xampp/XAMPP%20Linux/7.3.10/xampp-linux-x64-7.3.10-0-installer.run" -O xampp-installer.run
chmod +x xampp-installer.run
sudo ./xampp-installer.run
echo -e '[Desktop Entry]\n Version=1.0\n Name=xampp\n Exec=gksudo /opt/lampp/manager-linux-x64.run\n Icon=/opt/lampp/icons/world1.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/xampp.desktop
sudo apt-get install gksu
sudo chmod +x /usr/share/applications/xampp.desktop

cp /usr/share/applications/xampp.desktop  ~/Área\ de\ Trabalho/
sudo /opt/lampp/manager-linux-x64.run
