#!/bin/bash
#title          : k8snode.sh
#description    : This script will create k8s nodes and will attach them to kubernetes master 
#author		    : Balkrishna Mangal Atmaram Londhe 
#Email          : londhebalkrishna@gmail.com
#version        : 0.7    
#usage		    : sudo sh k8snode.sh
#notes          : Install Vim and Emacs to usethis script.
#============================================================================================================================================================
# Copyright (c) 2020 Balkrishna Mangal Atmaram Londhe (BK) - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the MIT License
# 
# You should have received a copy of the MIT License with
# this file. If not, please write to: londhebalkrishna@gmail.com , or visit : https://github.com/BalkrishnaBK/Basic-Installation/blob/master/LICENSE
#============================================================================================================================================================
#
echo " K8s Node Installation Started " 
sudo apt-get update
sudo apt-get upgrade
echo " Curl installation Started " 
sudo apt-get install -y curl
echo " Curl installation Done Successfully " 
echo " Docker installation Started " 
#sudo apt-get install -y docker.io
sudo curl https://releases.rancher.com/install-docker/17.03.sh | sh
echo " Docker installation Done "
echo "Starting Docker"
sudo systemctl start docker
echo "Enabling Docker"
sudo systemctl enable docker  
echo " Checking Packages " 
sudo curl -s https://packages.cloud.google.com/apt/dists/kubernetes-xenial/main/binary-amd64/Packages | grep Version | awk '{print $2}'
echo " Removing Locks"
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock
echo " Locks Removed Successfully " 
echo " Applying Swapoff " 
sudo sed -i.bak '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
sudo swapoff -a
echo " Installation of K8s Started " 
sudo apt-get update && sudo apt-get install -y apt-transport-https curl
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - && \
echo " deb http://apt.kubernetes.io/ kubernetes-xenial main "  | sudo tee /etc/apt/sources.list.d/kubernetes.list && \
sudo apt-get update -q && \
sudo apt-get install -qy kubelet=1.11.3-00 kubectl=1.11.3-00 kubeadm=1.11.3-00
echo " Installation of K8s Successfully Done " 
echo " Checking Versions " 
echo " Version of KUBEADM- " 
sudo kubeadm version
echo " Version of KUBECTL- " 
sudo kubectl version
echo " Version of KUBELET- " 
sudo kubelet --version
echo " Applying Hold " 
sudo apt-mark hold kubelet kubeadm kubectl
sudo kubeadm join ****