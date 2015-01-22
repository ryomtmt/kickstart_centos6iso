# kickstart_centos6iso

- Media Copy and config file Update

 rsync -a /media/ tmpsrc
 /bin/cp -a tmpsrc/isolinux/isolinux.cfg config/
 sed -i -e 's/^default vesamenu.c32/default kickstart/' config/isolinux.cfg
 sed -i -e 's/^menu color scrollbar\(.*\)$/menu color scrollbar 0 #ffffffff #00000000\n\nlabel kickstart\n  menu label \^Kickstart install\n  menu default\n  kernel vmlinuz\n  append ks=cdrom:\/isolinux\/ks.cfg initrd=initrd.img/' config/isolinux.cfg

- Usage

 yum install -y mkisofs
 rsync -av config/ tmpsrc/isolinux
 cd tmpsrc/
 mkisofs -r -J -o ../centos6-ks.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table .

