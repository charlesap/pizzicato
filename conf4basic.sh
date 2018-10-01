apt-get update
systemctl stop systemd-timesyncd
systemctl disable systemd-timesyncd
apt-get install ntpdate
apt-get install build-essential -y
apt-get install net-tools openssh-server pv git -y
timedatectl set-ntp True
timedatectl set-timezone America/Los_Angeles
/etc/init.d/ntp stop
/etc/init.d/ntp start
apt-get install alsa-utils mpg123
apt-get install python-dev python-rpi.gpio

modprobe snd_bcm2835
amixer cset numid=3 1
