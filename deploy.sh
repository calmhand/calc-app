#!/usr/bin/env sh

set -e

npm run build

cd dist/

git init

git add -A

git commit -m 'latest deploy ver'

git push -f git@github.com:calmhand/calc-app.git master:gh-pages

`cd -`