#
# Created by ligles on 07/11/16.
#
# Install docker on linux Mint 18 Sarah (Linux kernel 4.4 and an Ubuntu 16.04)
# Based on https://docs.docker.com/engine/installation/linux/ubuntulinux/
#

# On Mint sarah, https transport for apt is available but we still test it

if [!-e /usr/lib/apt/methods/https ]; then
    sudo apt-get update
    sudo apt-get install -y apt-transport-https
fi

# Update apt sources
# Add the GPG Key

$ sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Create a docker.list file and add the repository url

$ echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list

# Update apt package index

sudo apt-get update

# For Ubuntu Trusty, and Xenial, it?s recommended to install the linux-image-extra-* kernel packages
#  On Mint install linux-image-generic will install linux-image-extra-4.4.0-45-generic (see https://community.linuxmint.com/software/view/linux-image-extra-virtual)


sudo apt-get install -y linux-image-generic linux-image-extra-virtual
#remove all old package
sudo apt autoremove -y

#Install docker
sudo apt-get update
sudo apt-get install -y docker.io

#Add current user to docker group (don't use sudo to execute docker)

sudo usermod -a -G docker $USER

#start docker and verify all is installed correctly
sudo service docker start

sudo docker run hello-world