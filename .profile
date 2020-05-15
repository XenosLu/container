#!/bin/sh
export media=/share/CACHEDEV1_DATA/Multimedia/media
export onedrive=/share/CACHEDEV1_DATA/Utilities/onedrive
export onedrivex=/share/CACHEDEV1_DATA/Utilities/onedrivex
export onemirror=/share/CACHEDEV1_DATA/Utilities/onemirror

alias ll="ls -alh"
alias x="sh $onedrivex/scriptz/docker_util.sh"
alias media="cd $media"
alias onedrive="cd $onedrive"
alias onedrive="cd $onedrivex"
alias onemirror="cd $onemirror"
alias nas="ssh admin@192.168.2.150"
