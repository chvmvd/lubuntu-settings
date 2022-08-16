# #VAGRANT
# vagrant box remove centos/7

# #DOCKER
# cat docker_name | sed 's/ /\n/g' | xargs -I NAME sh -c 'docker rmi < NAME.tar'

# cron
cd /home
sudo tar czf cron.tar.gz /var/spool/cron

# backup
sudo tar cf w.tar w/
cd ~
