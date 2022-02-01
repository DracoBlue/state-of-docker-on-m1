#!/bin/sh

if [ "$1" = "description" ]
then
  echo "varnish 6.0.10 image"
  exit 0
fi

if [ "$1" = "expected" ]
then
  echo "Expected Success: \n"
  cat <<-'EXPECTED_SUCCESS'
Warnings:
VCL compiled.

Debug: Version: varnish-6.0.10 revision 9a7da4ff4c0c824af33e230740a11e99fdca23d9
Debug: Platform: Linux,3.13.0-117-generic,x86_64,-junix,-smalloc,-sdefault,-hcritbit
Debug: Child (19) Started
Info: Child (19) said Child starts
EXPECTED_SUCCESS
  echo "\nExpected Error: \n"
  cat <<-'EXPECTED_ERROR'
Error:
Message from VCC-compiler:
Assert error in vju_subproc(), mgt/mgt_jail_unix.c line 212:
  Condition((initgroups(vju_user, vju_gid)) == 0) not true.
  errno = 1 (Operation not permitted)
Running VCC-compiler failed, signal 6
VCL compilation failed
EXPECTED_ERROR
  exit 0;
fi

if [ ! `which docker` ]
then
  exit 1;
fi

TEMP_FILE=$(mktemp)

docker run --platform linux/amd64 --rm varnish:6.0.10 -F 2>&1 | cat - > $TEMP_FILE &

sleep 10

kill %1 || true

cat $TEMP_FILE | grep "Operation not permitted" > /dev/null

if [ "$?" = "0" ]
then
  rm $TEMP_FILE
  exit 1;
fi

rm $TEMP_FILE
