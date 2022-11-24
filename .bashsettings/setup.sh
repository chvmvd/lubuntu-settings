# sudo apt install virtualbox-guest-utils
# mount.vboxsf share ~/share # ~/.bashrcに書いておく。

# # cron
# cd /home
# sudo tar xzf cron.tar.gz -C /var/spool/cron

# tar xf w.tar
# cd ~
# update
sudo apt update
sudo apt -y autoremove
sudo apt -y upgrade
sudo apt -y autoremove
# package
sudo apt -y install snapd curl git
# utilities
sudo apt -y install pwgen rename tree sl silversearcher-ag adb tmux autokey-gtk #clamav exfat-fuse exfat-utils
# key layout
sudo apt -y install xcape # uim-skk
sudo apt -y install language-selector-gnome fcitx5-mozc fcitx5-rime
# editor
# sudo apt -y install emacs ddskk vim

# Atom
# if ! type atom > /dev/null 2>&1;then
#   wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add - \
#   && sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list' \
#   && sudo apt update \
#   && sudo apt -y install atom
# fi

# bchunk
sudo apt -y install bchunk
# browser
sudo apt -y install chromium-browser # w3m
# keepass2
# sudo apt -y install keepass2

# sudo apt -y install blender
sudo snap install youtube-dl

# DVD Player
if ! type brasero > /dev/null 2>&1;then
  sudo apt -y install brasero vlc \
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

sudo ln -s /usr/share/doc/git/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight
sudo chmod +x /usr/share/doc/git/contrib/diff-highlight/diff-highlight

# Lazygit
if ! type lazygit > /dev/null 2>&1;then
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
fi

# 中国語をインストール dbeaber vscode zoom simplescreenrecorder

# # #VAGRANT
# # vagrant box add centos/7
#
# #DOCKER
# cat docker_name | sed 's/ /\n/g' | xargs -I NAME sh -c 'docker load < NAME.tar'
