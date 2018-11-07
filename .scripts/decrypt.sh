#!/bin/bash

set -e

gpg --decrypt --output ~/.gpg.key ~/.gpg.key.secret

gpg --import ~/.gpg.key

gpg --decrypt --output ~/.ssh/id_rsa ~/.ssh/id_rsa.secret
