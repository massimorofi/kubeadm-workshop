#!/bin/sh

#clean environment - fix few issues
swapoff -a
free -m
kubeadm reset

# runi kubeadm init
kubeadm init --config kubeadm.yaml > kinit.log
