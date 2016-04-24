#!/bin/sh

# re-create tftp directory if needed
mkdir -p -m 755 /var/lib/tftp

# fetch new versions of ipxe and coreos if needed
cd /var/lib/tftp
wget -c -N http://boot.ipxe.org/undionly.kpxe
wget -c -N http://alpha.release.core-os.net/amd64-usr/current/coreos_production_pxe.vmlinuz
wget -c -N http://alpha.release.core-os.net/amd64-usr/current/coreos_production_pxe.vmlinuz.sig
wget -c -N http://alpha.release.core-os.net/amd64-usr/current/coreos_production_pxe_image.cpio.gz
wget -c -N http://alpha.release.core-os.net/amd64-usr/current/coreos_production_pxe_image.cpio.gz.sig

# verify image signatures
gpg --trusted 50E0885593D2DCB4 --verify coreos_production_pxe.vmlinuz.sig
gpg --trusted 50E0885593D2DCB4 --verify coreos_production_pxe_image.cpio.gz.sig

# start dnsmasq
exec dnsmasq --conf-file=/etc/dnsmasq.conf --no-daemon

