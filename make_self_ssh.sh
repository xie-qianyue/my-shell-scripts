#!/usr/bin/env bash

mkdir -p ~/.ssh
chmod 700 ~/.ssh
ssh-keygen -t dsa -f ~/.ssh/id_dsa -N ''
cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
