#!/bin/sh
ENV_STR=""
if [ ! -z "$HTTP_PORT" ]
then
      ENV_STR="${ENV_STR} -e HTTP_PORT"
fi
if [ ! -z "$HTTPS_PORT" ]
then
      ENV_STR="${ENV_STR} -e HTTPS_PORT"
fi
if [ ! -z "$HOST" ]
then
      ENV_STR="${ENV_STR} -e HOST"
fi
if [ ! -z "$HEADERS" ]
then
      ENV_STR="${ENV_STR} -e HEADERS"
fi
if [ ! -z "$HEADERS" ]
then
      ENV_STR="${ENV_STR} -e COOKIES"
fi
MSYS_NO_PATHCONV=1 docker run ${ENV_STR} --rm --name httpobs -v $PWD/results:/data httpobs