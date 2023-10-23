#!/bin/bash

PATH=${1}
URL=${2}
OWNER=${3}
GROUP=${4}

cd "${PATH}"
echo "$PATH $URL $OWNER $GROUP"
/bin/sudo /usr/local/bin/docker run --rm -i \
  -e PGID=$(/bin/id -g ${GROUP}) \
  -e PUID=$(/bin/id -u ${OWNER}) \
  -v "${PATH}":/workdir:rw \
  mikenye/youtube-dl \
  ${URL} \
  -o '%(title)s.%(ext)s'
