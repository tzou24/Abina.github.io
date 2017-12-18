#!/bin/zsh
# Author: Robin Wen
# Date: 2015-03-10 11:43:27
# Desc: Auto push after update the repo.
# Test GitHub sync to GitCafe.

source ~/.zshrc
git add -A .
git commit -m "$1"
fuckgfw git push origin master
