#!/bin/bash

NAME=${1}.mp4
PATH=${2}
URL=${3}
OWNER=${4}
GROUP=${5}

if [[ ${NAME} == ".mp4" ]]; then
  exit 0
fi

cd "${PATH}"
/bin/wget -nc -O ${NAME} ${URL}
/bin/chown ${OWNER}:${GROUP} ${NAME}
echo "$NAME $PATH $URL $OWNER $GROUP"
