#!/usr/bin/env zsh

. "$XDG_CONFIG_HOME/zsh/zshrc.d/functions"

date

if identifyGfxCard | grep Integrated; then
	echo -n "blue" | nc -4u -w0 localhost "$AB_GFX";
else
	echo -n "orange" | nc -4u -w0 localhost "$AB_GFX";
fi;

