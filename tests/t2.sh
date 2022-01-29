#!/bin/sh

if [ "$1" = "description" ]
then
  echo "alpine openresty amd64 image"
  exit 0
fi

if [ ! `which docker` ]
then
  exit 1;
fi

docker run --platform linux/amd64 --rm openresty/openresty:1.19.9.1-5-alpine nginx -t 2>&1 | grep "error" > /dev/null

if [ "$?" = "0" ]
then
  exit 1;
fi