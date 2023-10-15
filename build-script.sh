#!/bin/bash

set -e

whoami

apt update
apt install -y xz-utils make gcc g++

ls -l /app/bin
cp /app/bin/stack /usr/local/bin

cat /proc/sys/net/ipv6/conf/all/disable_ipv6

apt install -y ca-certificates

cd /app

stack setup --allow-different-user --system-ghc
stack build --allow-different-user --system-ghc