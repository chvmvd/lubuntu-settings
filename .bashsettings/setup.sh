# Update
sudo apt update
sudo apt -y autoremove
sudo apt -y upgrade
sudo apt -y autoremove

# Package Manager
sudo apt -y install snapd curl

# Key Layout
sudo apt -y install xcape
sudo apt -y install language-selector-gnome fcitx5-mozc fcitx5-rime # uim-skk

# Git
sudo apt -y install git
sudo ln -s /usr/share/doc/git/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight
sudo chmod +x /usr/share/doc/git/contrib/diff-highlight/diff-highlight
# Lazygit
if ! type lazygit > /dev/null 2>&1;then
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
fi

# Browser
sudo apt -y install chromium-browser # w3m

# Utilities
sudo apt -y install pwgen rename tree sl silversearcher-ag adb tmux autokey-gtk
sudo snap install youtube-dl
sudo apt -y install blender texlive-full

# DVD Player
if ! type brasero > /dev/null 2>&1;then
  sudo apt -y install brasero vlc bchunk \
  && sudo apt -y install libdvd-pkg \
  && sudo dpkg-reconfigure libdvd-pkg \
  && sudo dpkg --configure -a
fi

# Docker
if ! type docker > /dev/null 2>&1;then
  sudo apt-get update
  sudo apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
  sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin

  sudo groupadd docker
  sudo usermod -aG docker $USER
  newgrp docker
fi

# 中国語をインストール VSCode Zoom simplescreenrecorder
