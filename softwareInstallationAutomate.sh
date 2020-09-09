#!/bin/bash

sudo apt update
sudo apt -y upgrade
sudo apt -y upgrade
sudo apt install -y hollywood
sudo apt install -y cmatrix
sudo apt install -y scrcpy
sudo apt install -y winff
sudo apt install -y simplescreenrecorder
sudo apt install -y totem
sudo apt install -y gnome-disk-utility
sudo apt install -y persepolis
sudo apt install -y software-properties-common
#sudo apt install virtualbox
sudo apt update
sudo apt -y upgrade

mkdir /home/ozil/Desktop/GitHub
mkdir /home/ozil/Public/sh
mkdir /home/ozil/Public/run
mkdir /home/ozil/Public/jet_brains
mkdir /home/ozil/Public/deb

# copy sh
cd /media/ozil/LINUX_DATA/programmes/sh
cp jdk-8u111-nb-8_2-linux-x64.sh /home/ozil/Public/sh

# copy run
cd /media/ozil/LINUX_DATA/programmes/run\ programmes/
cp balenaEtcher-1.5.52-x64.AppImage /home/ozil/Public/run
cp get-pip.py /home/ozil/Public/run

# copy Packet Tracer
cd /media/ozil/LINUX_DATA/programmes/
cp -R Packet_Tracer /home/ozil/Public

# copy jet brains
cd /media/ozil/LINUX_DATA/programmes/jet\ brains/
cp -R Clion /home/ozil/Public/jet_brains
cp -R idea /home/ozil/Public/jet_brains
cp -R pycharm /home/ozil/Public/jet_brains

# copy graphics
cd /media/ozil/LINUX_DATA/programmes/graphics/
sudo cp conio.h /usr/include

# copy deb
cd /media/ozil/LINUX_DATA/programmes/deb
cp -R VSCode /home/ozil/Public/deb
cp discord-0.0.11.deb /home/ozil/Public/deb
cp GitHubDesktop-linux-2.5.3-linux1.deb /home/ozil/Public/deb
cp google-chrome-stable_current_amd64.deb /home/ozil/Public/deb 
cp teamviewer_15.1.3937_amd64.deb /home/ozil/Public/deb

# give permissions to sh & install jdk
cd /home/ozil/Public/sh/
sudo chmod +x jdk-8u111-nb-8_2-linux-x64.sh
sudo ./jdk-8u111-nb-8_2-linux-x64.sh

# give permissions to run & install pip and pycryptodomex
cd /home/ozil/Public/run/
sudo chmod +x balenaEtcher-1.5.52-x64.AppImage
python get-pip.py
pip install pycryptodomex
pip install pycryptodomex

# give permissions to Packet_Tracer & extract Packet Tracer 7.2.1 for Linux 64 bit.tar.gz
cd /home/ozil/Public/Packet_Tracer/
sudo chmod +x zlib1g-udeb_1.2.8.dfsg-2+b1_amd64.udeb libc6-udeb_2.19-18+deb8u10_amd64.udeb libpng12-0-udeb_1.2.50-2+deb8u3_amd64.udeb
cd /home/ozil/Public/Packet_Tracer/Packet_Tracer/
tar -xvzf Packet\ Tracer\ 7.2.1\ for\ Linux\ 64\ bit.tar.gz
rm -rf Packet\ Tracer\ 7.2.1\ for\ Linux\ 64\ bit.tar.gz

# extract jet brains 
cd /home/ozil/Public/jet_brains/Clion/
tar -xvzf CLion-2020.2.tar.gz
rm CLion-2020.2.tar.gz
cd /home/ozil/Public/jet_brains/idea
tar -xvzf ideaIU-2020.2.tar.gz
rm ideaIU-2020.2.tar.gz
cd /home/ozil/Public/jet_brains/pycharm
tar -xvzf pycharm-professional-2020.2.tar.gz
rm pycharm-professional-2020.2.tar.gz

# give permissions deb & install all deb package
cd /home/ozil/Public/deb/VSCode/
mv code_1.48.2-1598353430_amd64.deb /home/ozil/Public/deb/
mv  VSCode_Ex/ /home/ozil/Desktop/
cd ..
mv  VSCode/ /home/ozil
cd /home/ozil/Public/deb/
sudo chmod +x code_1.48.2-1598353430_amd64.deb discord-0.0.11.deb GitHubDesktop-linux-2.5.3-linux1.deb google-chrome-stable_current_amd64.deb teamviewer_15.1.3937_amd64.deb
sudo dpkg -i code_1.48.2-1598353430_amd64.deb
sudo dpkg -i discord-0.0.11.deb
sudo apt -f install -y 
sudo dpkg -i GitHubDesktop-linux-2.5.3-linux1.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo dpkg -i teamviewer_15.1.3937_amd64.deb

# install packet tracer 
cd /home/ozil/Public/Packet_Tracer/
sudo dpkg -i zlib1g-udeb_1.2.8.dfsg-2+b1_amd64.udeb
sudo dpkg -i libc6-udeb_2.19-18+deb8u10_amd64.udeb
sudo dpkg -i libpng12-0-udeb_1.2.50-2+deb8u3_amd64.udeb
cd /home/ozil/Public/Packet_Tracer/Packet_Tracer/
./install

# install balenaEtcher
cd /home/ozil/Public/run/
./balenaEtcher-1.5.52-x64.AppImage

# GitHub download my projects
cd /home/ozil/Desktop/GitHub/
git clone https://github.com/mmsaeed509/softwareInstallationAutomate.git
git clone https://github.com/mmsaeed509/GOFO_System_SoftwareEngineering_1_Project.git
git clone https://github.com/mmsaeed509/GOFO_System_SoftwareEngineering_1_Project_JavaDocHTML.git
git clone https://github.com/mmsaeed509/GOFO_System.git
git clone https://github.com/mmsaeed509/JavaDocHTML_GOFO-System.git
git clone https://github.com/mmsaeed509/BankSystem.git
git clone https://github.com/mmsaeed509/Graphics.git
git clone https://github.com/mmsaeed509/Ransomware.git


