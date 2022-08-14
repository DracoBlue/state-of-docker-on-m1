#!/bin/sh

if [ "$1" = "description" ]
then
  echo "no error like 'l: applet not found'"
  exit 0
fi

if [ "$1" = "expected" ]
then
  echo "Expected Success: \n"
  cat <<-'EXPECTED_SUCCESS'
total 36
drwxr-xr-x    2 root     root         12288 Jul 29 01:32 bin
drwxr-xr-x    5 root     root           340 Aug 14 21:59 dev
drwxr-xr-x    1 root     root          4096 Aug 14 21:59 etc
drwxr-xr-x    2 nobody   nobody        4096 Jul 29 01:32 home
dr-xr-xr-x  246 root     root             0 Aug 14 21:59 proc
drwx------    2 root     root          4096 Jul 29 01:32 root
dr-xr-xr-x   13 root     root             0 Aug 14 21:59 sys
drwxrwxrwt    2 root     root          4096 Jul 29 01:32 tmp
drwxr-xr-x    3 root     root          4096 Jul 29 01:32 usr
drwxr-xr-x    4 root     root          4096 Jul 29 01:32 var
EXPECTED_SUCCESS
  echo "\nExpected Error: \n"
  cat <<-'EXPECTED_ERROR'
l: applet not found
EXPECTED_ERROR
  exit 0;
fi

if [ ! `which docker` ]
then
  exit 1;
fi

docker run --rm --platform linux/amd64 --entrypoint ls busybox -l / 2>&1 | cat - | grep "applet not found" > /dev/null

if [ "$?" = "0" ]
then
  exit 1;
fi
