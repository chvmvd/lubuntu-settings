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
sudo apt -y install xcape uim-skk
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

sudo apt -y install blender
sudo snap install youtube-dl

# Signal
if ! type signal-desktop > /dev/null 2>&1;then
  wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg \
  && cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null \
  && echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee -a /etc/apt/sources.list.d/signal-xenial.list \
  && sudo apt update && sudo apt -y install signal-desktop
fi

# DVD Player
if ! type brasero > /dev/null 2>&1;then
  sudo apt -y install brasero vlc \
  && sudo apt -y install libdvd-pkg \
  && sudo dpkg-reconfigure libdvd-pkg \
  && sudo dpkg --configure -a
fi

# Docker
if ! type docker > /dev/null 2>&1;then
  sudo apt -y install gnome-terminal
  sudo apt update
  sudo apt install ca-certificates curl gnupg lsb-release
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  curl -o dockerLatest.deb https://desktop.docker.com/linux/main/amd64/docker-desktop-4.11.0-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64 \
  sudo apt update
  sudo apt install ./dockerLatest.deb
  rm dockerLatest.deb
fi

# # #VAGRANT
# # vagrant box add centos/7
#
# #DOCKER
# cat docker_name | sed 's/ /\n/g' | xargs -I NAME sh -c 'docker load < NAME.tar'
