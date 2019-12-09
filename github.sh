cd
mkdir .ssh
cd .ssh
ssh-keygen -t rsa -b 4096
sudo apt-get install xclip
xclip -sel clip < ~/.ssh/id_rsa.pub
