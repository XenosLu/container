#!/bin/sh
alias ll="ls -alh"
alias x="sh /share/CACHEDEV1_DATA/Utilities/onedrive/scriptz/docker_util.sh"
alias media="cd /share/CACHEDEV1_DATA/Multimedia/media"
alias onedrive="cd /share/CACHEDEV1_DATA/Utilities/onedrive"
alias nas="ssh admin@192.168.2.150"
alias initnas='ssh-keygen -t rsa -P ""  -f ~/.ssh/id_rsa -C "xenos.lu@gmail.com" && ssh-copy-id admin@192.168.2.150'

export media=/share/CACHEDEV1_DATA/Multimedia/media
export onedrive=/share/CACHEDEV1_DATA/Utilities/onedrive
