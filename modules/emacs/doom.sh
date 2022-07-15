#!/bin/sh -e

git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

script_path=$(dirname "$(realpath "$0")")
doom_path=$(fd -Ha doom.d "$script_path")
rm -rf ~/.doom.d
ln -sf "$doom_path" ~/.doom.d
