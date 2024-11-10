#!/bin/bash

echo "127.0.0.1       junsbae.42.fr
127.0.0.1       localhost
::1             localhost ip6-localhost ip6-loopback
fe00::0         ip6-localnet
ff00::0         ip6-mcastprefix
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters
172.18.0.4      fa9cfb2fb25b" > /etc/hosts

exec "$@"