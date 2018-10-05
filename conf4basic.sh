
apt-get update

systemctl stop systemd-timesyncd
systemctl disable systemd-timesyncd
apt-get install ntpdate

apt-get install build-essential -y
apt-get install net-tools openssh-server pv git -y
apt-get install input-utils -y

systemctl enable ssh
systemctl start ssh

timedatectl set-ntp True
timedatectl set-timezone America/Los_Angeles
#/etc/init.d/ntp stop
#/etc/init.d/ntp start

apt-get install alsa-utils mpg123
apt-get install python-dev python-rpi.gpio

modprobe snd_bcm2835
amixer cset numid=3 1


if [ "$1" == "kbd" ]; then 

rm /root/61matrix.dts

cat << EOF >> /root/61matrix.dts
    /dts-v1/;
    /plugin/;
    / {
           compatible = "brcm,bcm2835", "brcm,bcm2708", "brcm,bcm2709";

           fragment@0 {
              target-path = "/";
              __overlay__ {
                 keypad: MATRIX6x11 {
                    compatible = "gpio-matrix-keypad";
                    debounce-delay-ms = <10>;
                    col-scan-delay-us = <10>;
                    /* 
		       try to use GPIO only lines
                       to keep SPI and I2C usable
                    */
                                 

                    row-gpios = <&gpio 13 0    // 0
                                 &gpio 19 0    // 1
                                 &gpio 26 0    // 2
                                 &gpio 21 0    // 3
                                 &gpio 20 0    // 4
                                 &gpio 16 0    // 5
                                 &gpio 12 0    // 6
                                 &gpio 25 0    // 7
                                 &gpio 24 0    // 8
                                 &gpio 23 0    // 9
                                 &gpio 18 0>;    // 10
                                 
                    col-gpios = <&gpio 4 0    // 0
                                 &gpio 17 0    // 1
                                 &gpio 27 0    // 2
                                 &gpio 22 0    // 3
                                 &gpio 5 0     // 4
                                 &gpio 6 0>;   // 5
                                 


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
                                    // col0 row3 KEY_LEFT
                                    0x00000069
                                    // col0 row4 KEY_KP0
                                    0x01000052
                                    // col0 row5 KEY_RIGHT
                                    0x0200006a


                                    // col1 row0 KEY_LEFT
                                    0x00000069
                                    // col1 row1 KEY_KP0
                                    0x01000052
                                    // col1 row2 KEY_RIGHT
                                    0x0200006a
                                    // col1 row3 KEY_LEFT
                                    0x00000069
                                    // col1 row4 KEY_KP0
                                    0x01000052
                                    // col1 row5 KEY_RIGHT
                                    0x0200006a

                                    // col2 row0 KEY_LEFT
                                    0x00000069
                                    // col2 row1 KEY_KP0
                                    0x01000052
                                    // col2 row2 KEY_RIGHT
                                    0x0200006a
                                    // col2 row3 KEY_LEFT
                                    0x00000069
                                    // col2 row4 KEY_KP0
                                    0x01000052
                                    // col2 row5 KEY_RIGHT
                                    0x0200006a

                                    // col3 row0 KEY_LEFT
                                    0x00000069
                                    // col3 row1 KEY_KP0
                                    0x01000052
                                    // col3 row2 KEY_RIGHT
                                    0x0200006a
                                    // col3 row3 KEY_LEFT
                                    0x00000069
                                    // col3 row4 KEY_KP0
                                    0x01000052
                                    // col3 row5 KEY_RIGHT
                                    0x0200006a

                                    // col4 row0 KEY_LEFT
                                    0x00000069
                                    // col4 row1 KEY_KP0
                                    0x01000052
                                    // col4 row2 KEY_RIGHT
                                    0x0200006a
                                    // col4 row3 KEY_LEFT
                                    0x00000069
                                    // col4 row4 KEY_KP0
                                    0x01000052
                                    // col4 row5 KEY_RIGHT
                                    0x0200006a

                                    // col5 row0 KEY_LEFT
                                    0x00000069
                                    // col5 row1 KEY_KP0
                                    0x01000052
                                    // col5 row2 KEY_RIGHT
                                    0x0200006a
                                    // col5 row3 KEY_LEFT
                                    0x00000069
                                    // col5 row4 KEY_KP0
                                    0x01000052
                                    // col5 row5 KEY_RIGHT
                                    0x0200006a

                                    // col6 row0 KEY_LEFT
                                    0x00000069
                                    // col6 row1 KEY_KP0
                                    0x01000052
                                    // col6 row2 KEY_RIGHT
                                    0x0200006a
                                    // col6 row3 KEY_LEFT
                                    0x00000069
                                    // col6 row4 KEY_KP0
                                    0x01000052
                                    // col6 row5 KEY_RIGHT
                                    0x0200006a

                                    // col7 row0 KEY_LEFT
                                    0x00000069
                                    // col7 row1 KEY_KP0
                                    0x01000052
                                    // col7 row2 KEY_RIGHT
                                    0x0200006a
                                    // col7 row3 KEY_LEFT
                                    0x00000069
                                    // col7 row4 KEY_KP0
                                    0x01000052
                                    // col7 row5 KEY_RIGHT
                                    0x0200006a

                                    // col8 row0 KEY_LEFT
                                    0x00000069
                                    // col8 row1 KEY_KP0
                                    0x01000052
                                    // col8 row2 KEY_RIGHT
                                    0x0200006a
                                    // col8 row3 KEY_LEFT
                                    0x00000069
                                    // col8 row4 KEY_KP0
                                    0x01000052
                                    // col8 row5 KEY_RIGHT
                                    0x0200006a

                                    // col9 row0 KEY_LEFT
                                    0x00000069
                                    // col9 row1 KEY_KP0
                                    0x01000052
                                    // col9 row2 KEY_RIGHT
                                    0x0200006a
                                    // col9 row3 KEY_LEFT
                                    0x00000069
                                    // col9 row4 KEY_KP0
                                    0x01000052
                                    // col9 row5 KEY_RIGHT
                                    0x0200006a

                                    // col10 row0 KEY_LEFT
                                    0x00000069
                                    // col10 row1 KEY_KP0
                                    0x01000052
                                    // col10 row2 KEY_RIGHT
                                    0x0200006a
                                    // col10 row3 KEY_LEFT
                                    0x00000069
                                    // col10 row4 KEY_KP0
                                    0x01000052
                                    // col10 row5 KEY_RIGHT
                                    0x0200006a>;



                 };
              };
           };
      };
EOF

  dtc -W no-unit_address_vs_reg -I dts -O dtb -o /root/61matrix.dtbo /root/61matrix.dts


fi

