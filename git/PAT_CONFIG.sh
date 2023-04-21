#!/bin/bash

#
# Copyright (C) 2022 Mahmoud Mohamed (00xWolf)  <https://github.com/mmsaeed509>
# LICENSE © GNU-GPL3
#

USERNAME="Mahmoud Mohamed (00xWolf - mmsaeed509)"
E_MAIL="mmsaeed509@gmail.com"

# also, you can edit from < ~/.gitconfig > #
git config --global user.name ${USERNAME}
git config --global user.email ${E_MAIL}

# overall system, also you can edit from < /etc/gitconfig > #
git config --system user.name ${USERNAME}
git config --system user.email ${E_MAIL}

# Project ONLY, also you can edit from < /.git/config > #
git config user.name ${USERNAME}
git config user.email ${E_MAIL}