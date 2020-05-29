#!/bin/sh
MSYS_NO_PATHCONV=1 docker run --rm --name httpobs -v $PWD/results:/data httpobs