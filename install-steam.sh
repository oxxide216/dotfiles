#!/usr/bin/sh

sudo xbps-install void-repo-multilib-nonfree void-repo-multilib void-repo-nonfree
sudo xbps-install -S
sudo xbps-install steam libdrm-32bit nvidia-libs-32bit glibc-32bit mesa-32bit
