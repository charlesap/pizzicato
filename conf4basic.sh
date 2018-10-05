
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
                                    // col0 row0 KEY_1
                                    0x00000002
                                    // col0 row1 KEY_2
                                    0x00000003
                                    // col0 row2 KEY_3
                                    0x00000004
                                    // col0 row3 KEY_4
                                    0x00000005
                                    // col0 row4 KEY_5
                                    0x00000006
                                    // col0 row5 KEY_6
                                    0x00000007


                                    // col1 row0 KEY_7
                                    0x00000008
                                    // col1 row1 KEY_8
                                    0x00000009
                                    // col1 row2 KEY_9
                                    0x0000000a
                                    // col1 row3 KEY_0
                                    0x0000000b
                                    // col1 row4 KEY_MINUS
                                    0x0000000c
                                    // col1 row5 KEY_EQUAL
                                    0x0000000d

                                    // col2 row0 KEY_Q
                                    0x00000010
                                    // col2 row1 KEY_W
                                    0x00000011
                                    // col2 row2 KEY_E
                                    0x00000012
                                    // col2 row3 KEY_R
                                    0x00000013
                                    // col2 row4 KEY_T
                                    0x00000014
                                    // col2 row5 KEY_Y
                                    0x02000015

                                    // col3 row0 KEY_U
                                    0x00000016
                                    // col3 row1 KEY_I
                                    0x00000017
                                    // col3 row2 KEY_O
                                    0x00000018
                                    // col3 row3 KEY_P
                                    0x00000019
                                    // col3 row4 KEY_LEFTBRACE
                                    0x0000001a
                                    // col3 row5 KEY_RIGHTBRACE
                                    0x0000001b

                                    // col4 row0 KEY_A
                                    0x0000001e
                                    // col4 row1 KEY_S
                                    0x0000001f
                                    // col4 row2 KEY_D
                                    0x00000020
                                    // col4 row3 KEY_D
                                    0x00000021
                                    // col4 row4 KEY_F
                                    0x00000022
                                    // col4 row5 KEY_G
                                    0x00000023

                                    // col5 row0 KEY_H
                                    0x00000024
                                    // col5 row1 KEY_J
                                    0x00000025
                                    // col5 row2 KEY_K
                                    0x00000026
                                    // col5 row3 KEY_L
                                    0x00000027
                                    // col5 row4 KEY_SEMICOLON
                                    0x00000028
                                    // col5 row5 KEY_APOSTROPHE
                                    0x00000029

                                    // col6 row0 KEY_GRAVE
                                    0x0000002a
                                    // col6 row1 KEY_BACKSLASH
                                    0x0000002c
                                    // col6 row2 KEY_Z
                                    0x0000002d
                                    // col6 row3 KEY_X
                                    0x0000002e
                                    // col6 row4 KEY_C
                                    0x0000002f
                                    // col6 row5 KEY_V
                                    0x00000030

                                    // col7 row0 KEY_B
                                    0x00000031
                                    // col7 row1 KEY_N
                                    0x00000032
                                    // col7 row2 KEY_M
                                    0x00000033
                                    // col7 row3 KEY_COMMA
                                    0x00000034
                                    // col7 row4 KEY_DOT
                                    0x00000035
                                    // col7 row5 KEY_SLASH
                                    0x00000036

                                    // col8 row0 KEY_SPACE
                                    0x0000003a
                                    // col8 row1 KEY_F1
                                    0x0000003c
                                    // col8 row2 KEY_F2
                                    0x0000003d
                                    // col8 row3 KEY_F3
                                    0x0000003e
                                    // col8 row4 KEY_F4
                                    0x000000ef
                                    // col8 row5 KEY_F5
                                    0x00000040

                                    // col9 row0 KEY_F6
                                    0x00000041
                                    // col9 row1 KEY_F7
                                    0x00000042
                                    // col9 row2 KEY_F8
                                    0x00000043
                                    // col9 row3 KEY_F9
                                    0x00000044
                                    // col9 row4 KEY_F10
                                    0x00000045
                                    // col9 row5 KEY_KP7
                                    0x00000047

                                    // col10 row0 KEY_KP8
                                    0x00000048
                                    // col10 row1 KEY_KP9
                                    0x00000049
                                    // col10 row2 KEY_KPMINUS
                                    0x0000004a
                                    // col10 row3 KEY_KP4
                                    0x0000004b
                                    // col10 row4 KEY_KP5
                                    0x0000004c
                                    // col10 row5 KEY_KP6
                                    0x0000004d>;



                 };
              };
           };
      };
EOF

  dtc -W no-unit_address_vs_reg -I dts -O dtb -o /root/61matrix.dtbo /root/61matrix.dts
  cp /root/61matrix.dtbo /boot/overlays/

fi

