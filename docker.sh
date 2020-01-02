FGRED=`echo -e "\033[1;31m"`
FGCYAN=`echo -e "\033[0;36m"`
FGBLUE=`echo -e "\033[1;34m"`
FGPURPLE=`echo -e "\033[1;35m" `
FGGREEN=`echo -e "\033[1;32m"`
NORMAL=`echo -e "\033[0m"`

function _erro() {
  echo "${NORMAL}Ocorreu um erro tipo:${FGRED} $1: $(cat /tmp/erro)${NORMAL}"
  echo "${FGGREEN}sudo usermod -aG docker nome-do-seu-usuario${NORMAL}"
  echo "${FGCYAN}Após isto reinicie o seu computador e depois execute o comando ${FGPURPLE}docker info${FGRED} no seu terminal${NORMAL}"
  return
}

echo "${FGBLUE}Removendo outras versões do docker...${NORMAL}"
sudo apt-get remove docker docker-engine docker.io containerd runc
echo "${FGBLUE}Atualizando packages...${NORMAL}"
sudo apt update
echo "${FGBLUE}Baixando dependecias do docker...${NORMAL}"
sudo apt install apt-transport-https ca-certificates curl software-properties-common gnupg-agent 
echo "${FGBLUE}Baixando docker...${NORMAL}"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
echo "${FGBLUE}Atualizando packages...${NORMAL}"
sudo apt update
echo "${FGBLUE}Baixando docker-cli, docker-ce e containerd.io...${NORMAL}"
apt-cache policy docker-ce
echo "${FGBLUE}Instalando docker-cli, docker-ce e containerd.io...${NORMAL}"
sudo apt-get install docker-ce docker-ce-cli containerd.io
echo "${FGBLUE}Executando container Hello world de exemplo...${NORMAL}"
sudo docker run hello-world
echo "${FGBLUE}Criando grupo docker...${NORMAL}"
sudo groupadd docker
echo "${FGBLUE}Adcionando usuario no grupo grupo docker...${NORMAL}"
sudo usermod -aG docker $USERNAME || $USER 2>/tmp/erro
ACAO=$?
[ $ACAO -ne 0 ] && _erro $ACAO
echo "${FGGREEN}INSTALAÇÃO CONCLUIDA!${NORMAL}"
echo "${FGCYAN}Por Favor reinicie o seu computador e depois execute o comando ${FGGREEN}docker info${FGCYAN} no seu terminal${NORMAL}"