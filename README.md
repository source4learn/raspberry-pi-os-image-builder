# Raspberry Pi OS Image with Packer
In this setup, we will see how to create a custom Raspberry Pi image using Packer and its ARM builder plugin. This will let you modify the existing ARM image, provisioning and resize the filesystem partition in the Raspberry Pi as needed.

## Prerequisites

* Ubuntu 18.04/20.04 LTS
* Git
* Packer
* Packer ARM Builder Plugin

## Dependencies
Before we start building, you need to install the required dependencies on your host machine(Ubuntu 18.04/20.04 LTS). Just follow the steps given below to set up the build environment:

Install the required binaries on the host machine.

    sudo apt update
    sudo apt install git wget zip unzip build-essential kpartx qemu binfmt-support qemu-user-static e2fsprogs dosfstools


Download the Packer from the official website and configure it on your host machine.

For Ubuntu x64 based hosts

    export PACKER_RELEASE="1.6.6"
    cd /tmp/
    wget https://releases.hashicorp.com/packer/${PACKER_RELEASE}/packer_${PACKER_RELEASE}_linux_amd64.zip
    unzip packer_${PACKER_RELEASE}_linux_amd64.zip
    sudo mv packer /usr/local/bin
    packer --version

Alternatively, you can install Packer using apt packer managers. Follow the instructions from official Hashicorp documentation - https://learn.hashicorp.com/tutorials/packer/get-started-install-cli?in=packer/docker-get-started.

Download the Packer ARM builder plugin and configure the same on the host machine.

    export PACKER_ARM_BUILDER_VERSION="0.1.6"
    cd /tmp/
    wget https://github.com/solo-io/packer-builder-arm-image/releases/download/v${PACKER_ARM_BUILDER_VERSION}/packer-builder-arm-image
    sudo mv packer-builder-arm-image /usr/local/bin
    sudo chmod +x /usr/local/bin/packer-builder-arm-image

## Start building ARM image

For building the ARM image, the Packer uses the provisioners to mount the image on your local file system and to make changes in the base ARM image.

Clone the codebase from the GitHub repository and follow the instructions for building ARM images using Packer. Go to the `raspberry-pi-os-image-builder` directory and execute the Packer build command.

    # Clone GitHub repository
    git clone git@github.com:source4learn/raspberry-pi-os-image-builder.git
    cd raspberry-pi-os-image-builder
    sudo packer build packer-raspberry-pi-os-lite.json

Verify the file location and size once Packer build is completed. Archive the output image file to reduce the size on disk.

    # Check file location and size
    ls -la output-arm-image/image# Check file size
    du -hs output-arm-image/image

    # Create zip archive
    zip -r rpi-arm-image.zip output-arm-image/image

Use the Raspberry Pi Imager or any other tool to create a bootable SD card.

## Summary

If you encounter an error or problem in this setup, please report in the GitHub repository issues. Reach us in case you need any further assistance.

Email: source4learn@gmail.com

Twitter: @source4learn

LinkedIn: linkedin.com/in/source4learn
