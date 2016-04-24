# coreos-ipxe
container with dnsmasq / ipxe environment for pxe-booting coreos (from alpha channel)

###requirements###
- interface for DHCP and PXE booting with configured ip address 192.168.255.1/24 
- container must be run with --net=host and -d options

###first run###
at first run container downloads needed ipxe and coreos images (which might take some time, depending on your internet connection speed)
when container is restarted it tries to download newer version if present

###usage###
    docker run --net=host --name ipxe -d kciepluc/coreos-ipxe
