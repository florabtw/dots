#!/bin/bash

if [ -f ~/.gpg.key ]
then
  gpg --symmetric              \
    --output ~/.gpg.key.secret \
    ~/.gpg.key
fi

if [ -f ~/.ssh/id_rsa ]
then
  gpg --encrypt                   \
    --output ~/.ssh/id_rsa.secret \
    --recipient hello@flora.cool  \
    ~/.ssh/id_rsa
fi

if [ -f ~/.ssh/config ]
then
  gpg --encrypt                   \
    --output ~/.ssh/config.secret \
    --recipient hello@flora.cool  \
    ~/.ssh/config
fi
