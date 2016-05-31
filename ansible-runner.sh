#!/usr/bin/env sh
ls /ssh/* 1>/dev/null 2>&1 
if [ $? == 0 ]; then
	cp -r /ssh/* /root/.ssh
	chmod 600 /root/.ssh/*
fi
eval "$@"
