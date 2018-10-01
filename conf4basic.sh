
apt-get update

systemctl stop systemd-timesyncd
systemctl disable systemd-timesyncd
apt-get install ntpdate

apt-get install build-essential -y
apt-get install net-tools openssh-server pv git -y
apt-get install input-utils -y

systemctl enable ssh
systemct start ssh

timedatectl set-ntp True
timedatectl set-timezone America/Los_Angeles
#/etc/init.d/ntp stop
#/etc/init.d/ntp start

apt-get install alsa-utils mpg123
apt-get install python-dev python-rpi.gpio

modprobe snd_bcm2835
amixer cset numid=3 1


if [ "$1" == "kbd" ] then ;


cat << EOF >> /root/61matrix.dts
    /dts-v1/;
    /plugin/;
    / {
           compatible = "brcm,bcm2835", "brcm,bcm2708", "brcm,bcm2709";

           fragment@0 {
              target-path = "/";
              __overlay__ {
                 keypad: MATRIX4x5 {
                    compatible = "gpio-matrix-keypad";
                    debounce-delay-ms = <10>;
                    col-scan-delay-us = <10>;
                    /* 
		       try to use GPIO only lines
                       to keep SPI and I2C usable
                    */
                    row-gpios = <&gpio 27 0    // 1
                                 &gpio 22 0    // 2
                                 &gpio 10 0    // 3
                                 &gpio 9 0>;   // 4

                    col-gpios = <&gpio 13 0    // 5
                                 &gpio 26 0    // 6
                                 &gpio 16 0    // 7
                                 &gpio 20 0    // 8
                                 &gpio 21 0>;  // 9
                    /*
                      Keycodes from /usr/include/linux/input-event-codes.h
                      converted to hex using printf '%02x\n'
                    */

                    linux,keymap = <
                                    // col0 row0 KEY_LEFT
                                    0x00000069
                                    // col0 row1 KEY_KP0
                                    0x01000052
                                    // col0 row2 KEY_RIGHT
                                    0x0200006a
                                    // col0 row3 KEY_KPENTER
                                    0x03000060
				    // col1 row0 KEY_KP7
                                    0x00010047
                                    // col1 row1 KEY_KP8
                                    0x01010048
                                    // col1 row2 KEY_KP9
                                    0x02010049
                                    // col1 row3 KEY_ESC
                                    0x03010001
                                    // col2 row0 KEY_KP4
                                    0x0002004b
                                    // col2 row1 KEY_KP5
                                    0x0102004c
                                    // col2 row2 KEY_KP6
                                    0x0202004d
                                    // col2 row3 KEY_DOWN
                                    0x0302006c
                                    // col3 row0 KEY_KP1
                                    0x0003004f
                                    // col3 row1 KEY_KP2
                                    0x01030050
                                    // col3 row2 KEY_KP3
                                    0x02030051
                                    // col3 row3 KEY_UP
                                    0x03030067
                                    // col4 row0 KEY_F1
                                    0x0004003b
                                    // col4 row1 KEY_F2
                                    0x0104003c
                                    // col4 row2 KEY_KPSLASH there is no KP_#
                                    0x02040062
                                    // col4 row3 KEY_KPASTERISK
                                    0x03040037>;

                 };
              };
           };
      };
EOF

fi

