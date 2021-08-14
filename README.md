# Raspberry Pi OS Image with Packer
In this setup, we will see how to create a custom Raspberry Pi image using Packer and its ARM builder plugin. This will let you modify the existing ARM image, provisioning and resize the filesystem partition in the Raspberry Pi as needed.

## Prerequisites

* Ubuntu 18.04/20.04 LTS
* Git
* Packer
* Packer ARM Builder Plugin

## Dependencies
Before we start building, you need to install the required dependencies on your host machine(Ubuntu 18.04/20.04 LTS). Just follow the steps given below to set up the build environment:

* Download the Packer from the official Hashicorp website and configure it on your host machine.

For Ubuntu x64 based hosts
```bash
export PACKER_RELEASE="1.6.6"
cd /tmp/
wget https://releases.hashicorp.com/packer/${PACKER_RELEASE}/packer_${PACKER_RELEASE}_linux_amd64.zip
unzip packer_${PACKER_RELEASE}_linux_amd64.zip
sudo mv packer /usr/local/bin
packer --version
```
Alternatively, you can install Packer using apt packer managers. Follow the instructions from official Hashicorp documentation - https://learn.hashicorp.com/tutorials/packer/get-started-install-cli?in=packer/docker-get-started.

* Install the required binaries on the host machine.

```bash
sudo apt update
sudo apt install git wget build-essential kpartx qemu binfmt-support qemu-user-static e2fsprogs dosfstools
```

## Start building ARM image

For building the ARM image, the Packer uses the provisioners to mount the image on your local file system and to make changes in the base ARM image.

Clone the codebase from the GitHub repository and follow the instructions for building ARM images using Packer. Go to the `raspberry-pi-os-image-builder` directory and download the Packer ARM builder plugin from https://github.com/solo-io/packer-builder-arm-image. You need to get the release version `v0.1.6` and make it executable.

```bash
# Clone GitHub repository
git clone git@github.com:source4learn/raspberry-pi-os-image-builder.git
cd raspberry-pi-os-image-builder

# Download Packer ARM Builder Plugin
export PACKER_ARM_BUILDER_VERSION="0.1.6"
wget https://github.com/solo-io/packer-builder-arm-image/releases/download/v${PACKER_ARM_BUILDER_VERSION}/packer-builder-arm-image
sudo chmod 775 packer-builder-arm-image

# Execute Packer Build
sudo packer build packer-raspberry-pi-os-lite.json
```

## Summary
The above setup is based on the `solo-io/packer-builder-arm-image` which is a Packer plugin for ARM images. The alternative Packer ARM plugin `kaczanowski/packer-builder-arm` is also available with some additional features like extending the disk size or build ARM images from scratch.

If you encounter an error or problem in this setup, please report in the GitHub repository issues. Reach us in case you need any further assistance.

Email: source4learn@gmail.com

Twitter: @source4learn

LinkedIn: linkedin.com/in/source4learn
