#!/bin/bash

#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Exodia OS        #
#                                   #
#####################################

USERNAME="Mahmoud Mohamed (00xWolf - Gmail/GitHub: @mmsaeed509)"
E_MAIL="mmsaeed509@gmail.com"

# also, you can edit from < ~/.gitconfig > #
git config --global user.name ${USERNAME}
git config --global user.email ${E_MAIL}

# overall system, also you can edit from < /etc/gitconfig > #
sudo git config --system user.name ${USERNAME}
sudo git config --system user.email ${E_MAIL}

# Project ONLY, also you can edit from < /.git/config > #
git config user.name ${USERNAME}
git config user.email ${E_MAIL}

# set the default editor for commit msg #
git config --global core.editor "nvim"

# raising the postBuffer size #
git config --global http.postBuffer 524288000

# cache your credentials (in my case, it's useful for using GitLab) #
git config --global credential.helper cache  # caching your credentials for 15 min timeout

git config --global credential.helper 'cache --timeout=31536000'  # caching your credentials for 1-year timeout

git config --global color.ui true
