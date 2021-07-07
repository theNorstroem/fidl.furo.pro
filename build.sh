#!/usr/bin/env bash


# remove old search indexes
rm docs/en.search*
rm -rf tmp
git clone --depth 1 --sparse git@github.com:eclipse/eclipsefuro.git ./tmp

# build docs
hugo -s ./tmp/docs/fidl -d ../../../docs
rm -rf tmp

# add changes
git add docs/.

# autocommit
git commit -m "autocommit publish docs"
# publish by pushing changes
git push