#!/bin/bash

echo "git add ."
git add .
echo "git commit"
git commit -m "Add articles"
echo "git push origin hexo"
git push origin hexo

echo "hexo g -d"
hexo g -d

