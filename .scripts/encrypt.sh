#!/bin/bash

gpg --import ~/.gpg.key

gpg --symmetric              \
  --output ~/.gpg.key.secret \
  ~/.gpg.key

gpg --encrypt                            \
  --output /home/nick/.ssh/id_rsa.secret \
  --recipient me@nick.exposed            \
  /home/nick/.ssh/id_rsa
