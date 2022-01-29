#!/bin/sh

if [ "$1" == "description" ]
then
  echo "current stern amd64 image "
  exit 0
fi

if [ "$1" == "expected" ]
then
  echo "Expected Success: \n"
  cat <<-'EXPECTED_SUCCESS'
version: 1.21.0
EXPECTED_SUCCESS
  echo "\nExpected Error: \n"
  cat <<-'EXPECTED_ERROR'
runtime: failed to create new OS thread (have 2 already; errno=22)
fatal error: newosproc

runtime stack:
runtime.throw(0x116441c, 0x9)
	/usr/local/go/src/runtime/panic.go:596 +0x95
runtime.newosproc(0xc420022000, 0xc420032000)
	/usr/local/go/src/runtime/os_linux.go:163 +0x18c
runtime.newm(0x11e0148, 0x0)
	/usr/local/go/src/runtime/proc.go:1628 +0x137
runtime.main.func1()
	/usr/local/go/src/runtime/proc.go:126 +0x36
runtime.systemstack(0x18ba900)
	/usr/local/go/src/runtime/asm_amd64.s:327 +0x79
runtime.mstart()
	/usr/local/go/src/runtime/proc.go:1132

goroutine 1 [running]:
runtime.systemstack_switch()
	/usr/local/go/src/runtime/asm_amd64.s:281 fp=0xc42001e788 sp=0xc42001e780
runtime.main()
	/usr/local/go/src/runtime/proc.go:127 +0x6c fp=0xc42001e7e0 sp=0xc42001e788
runtime.goexit()
	/usr/local/go/src/runtime/asm_amd64.s:2197 +0x1 fp=0xc42001e7e8 sp=0xc42001e7e0
EXPECTED_ERROR
  exit 0;
fi

if [ ! `which docker` ]
then
  exit 1;
fi

docker run --platform linux/amd64 --rm alpine:latest sh -c 'cd /tmp && wget -q https://github.com/stern/stern/releases/download/v1.21.0/stern_1.21.0_linux_amd64.tar.gz && tar -zxf stern_1.21.0_linux_amd64.tar.gz && ./stern --version' 2>&1 | grep 'failed to create new OS thread' > /dev/null

if [ "$?" == "0" ]
then
  exit 1;
fi