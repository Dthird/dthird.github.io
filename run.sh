#!/bin/bash
echo "hexo clean"
hexo clean
echo "hexo g"
hexo g
echo "hexo d"
hexo d

echo "git add ."
git add .
echo "git commit"
git commit -m "Add articles"
echo "git push origin hexo"
git push origin hexo
