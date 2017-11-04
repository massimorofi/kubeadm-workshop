#!/bin/sh

#clean environment - fix few issues
swapoff -a
free -m
kubeadm reset
rm -Rf $HOME/.kube

# runi kubeadm init
kubeadm init --config kubeadm.yaml > kinit.log

#setup user configs
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
