#!/bin/sh

if [ `which podman` ]
then
  echo "--Podman-Info-----------------------------------------------------"
  podman info
fi

if [ `which colima` ]
then
  echo "--Colima-Version--------------------------------------------------"
  colima version
  echo "--Colima-Status---------------------------------------------------"
  colima status
fi

if [ `which limactl` ]
then
  echo "--Limactl-Version-------------------------------------------------"
  limactl --version
  echo "--Limactl-Info----------------------------------------------------"
  limactl info
fi

if [ `which docker` ]
then
  echo "--Docker----------------------------------------------------------"
  docker version

  echo "--binfmt----------------------------------------------------------"
  docker run --privileged --rm tonistiigi/binfmt
fi

if [ `which docker-compose` ]
then
  echo "--Docker-Compose--------------------------------------------------"
  docker-compose version
fi

if [ `which lsb_release` ]
then
  echo "--Lsb-Release-----------------------------------------------------"
  lsb_release -a
fi

if [ `which sw_vers` ]
then
  echo "--Sw-Vers---------------------------------------------------------"
  sw_vers
fi

echo "--uname-------------------------------------------------------------"
uname -a

echo "--------------------------------------------------------------------"
echo "Run tests: "

cd tests/

ls | grep '.sh' | while read file
do
  sh ./$file
  if [ "$?" = "0" ]
  then
    echo " - $file: ✅ OK"
  else
    echo " - $file: 🛑 FAILED"
  fi
done