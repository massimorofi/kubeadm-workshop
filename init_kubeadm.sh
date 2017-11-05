#!/bin/sh

#clean environment - fix few issues
swapoff -a
free -m
kubeadm reset
rm -Rf $HOME/.kube
mkdir -p $HOME/.kube


# runi kubeadm init
kubeadm init --config kubeadm.yaml > kinit.log

#setup user configs
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

# Fix kubelet bug 
sed 's/$KUBELET_SYSTEM_PODS_ARGS//g' /etc/systemd/system/kubelet.service.d/10-kubeadm.conf > /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
systemctl daemon-reload
systemctl restart kubelet