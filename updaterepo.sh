#!/bin/bash

#
# Copyright (C) 2022 Mahmoud Mohamed (Ozil)  <https://github.com/mmsaeed509>
# LICENSE © GNU-GPL3
#

# a simple script to updating repo database #

echo -e "\e[0;35m#################################### \e[0m"
echo -e "\e[0;35m#      updating repo database      # \e[0m"
echo -e "\e[0;35m#################################### \e[0m"

# old files to be removed! #
declare -a OLD_DATABASE=(exodia-repo.db exodia-repo.db.tar.gz exodia-repo.db.tar.gz.old exodia-repo.files exodia-repo.files.tar.gz exodia-repo.files.tar.gz.old)

# remove old files #
for i in ${OLD_DATABASE[@]}; do

	rm $i

done

echo ""
echo -e "\e[0;35m######################################### \e[0m"
echo -e "\e[0;35m#    old files removed successfully!    # \e[0m"
echo -e "\e[0;35m#########################################\e[0m"

# add all packages to database  #
echo ""
echo -e "\e[0;35m################################ \e[0m"
echo -e "\e[0;35m#  create database for pacman  # \e[0m"
echo -e "\e[0;35m################################ \e[0m"

repo-add exodia-repo.db.tar.gz *.pkg.tar.zst

# remove syslink to avoid any issues #
echo ""
echo -e "\e[0;35m######################################### \e[0m"
echo -e "\e[0;35m#  removing syslink to avoid any issues # \e[0m"
echo -e "\e[0;35m######################################### \e[0m"

rm exodia-repo.db exodia-repo.files

mv exodia-repo.db.tar.gz exodia-repo.db

mv exodia-repo.files.tar.gz exodia-repo.files

echo ""
echo -e "\e[0;35m########################### \e[0m"
echo -e "\e[0;35m#         D O N E!        # \e[0m"
echo -e "\e[0;35m########################### \e[0m"

