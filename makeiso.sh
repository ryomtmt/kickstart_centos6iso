#!/bin/sh

rsync -av config/ tmpsrc/isolinux
cd tmpsrc/
mkisofs -r -J -o ../centos6-ks.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table .

