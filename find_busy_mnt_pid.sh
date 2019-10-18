#!/bin/bash
#
# A simple script to get information about mount points and pids and their
# mount namespaces.
#
# usage: ./find-busy-mnt.sh 0bfafa146431771f6024dcb9775ef47f170edb2f152f71916ba44209ca6120a
# where 0bfafa146431771f6024dcb9775ef47f170edb2f152f71916ba44209ca6120a is in the error message:
# > docker rm 0bfafa146431
# Error response from daemon: Unable to remove filesystem for 0bfafa146431771f6024dcb9775ef47f170edb2f1852f71916ba44209ca6120a: remove /app/docker/containers/0bfafa146431771f6024dcb9775ef47f170edb2f152f71916ba44209ca6120a/shm: device or resource busy
# ref: https://success.docker.com/article/how-to-find-and-resolve-devicemapper-device-or-resource-busy-error
#


if [ $# -ne 1 ];then
  echo "Usage: $0 <devicemapper-device-id>"
  exit 1
fi

ID=$1

MOUNTS=`find /proc/*/mounts | xargs grep $ID 2>/dev/null`

[ -z "$MOUNTS" ] &&  echo "No pids found" && exit 0

printf "PID\tNAME\t\tMNTNS\n"
echo "$MOUNTS" | while read LINE; do
  PID=`echo $LINE | cut -d ":" -f1 | cut -d "/" -f3`
  # Ignore self and thread-self
  if [ "$PID" == "self" ] || [ "$PID" == "thread-self" ]; then
    continue
  fi
  NAME=`ps -q $PID -o comm=`
  MNTNS=`readlink /proc/$PID/ns/mnt`
  printf "%s\t%s\t\t%s\n" "$PID" "$NAME" "$MNTNS"
done
