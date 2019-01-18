#!/usr/bin/env zsh

$(ssh newcross.lan 'echo $SSH_CONNECTION; mosh-server' \
	|& head -n 2 \
	| awk \
	'/22/{ip=$3}; /CONNECT/{print "eval MOSH_KEY="$4,"mosh-client "ip,$3,$5}')

