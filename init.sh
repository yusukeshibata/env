#!/bin/sh

[ -d "$HOME/.git" ] && echo '-> Already initialized.' && exit 0

echo '-> Initializing...'
tmpdir=$(mktemp -d)
git clone https://github.com/yusukeshibata/env.git $tmpdir >/dev/null 2>&1
cp -r $tmpdir/. $HOME
rm -rf $tmpdir
echo '-> Done.'
