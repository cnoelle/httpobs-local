# does not work with 3.8!
FROM python:3.7-slim-buster

## install dependencies
# gcc required to build some python package
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y gcc && \
#	apt-get install -y libpq-dev && \
	apt-get install -y git && \
    apt-get clean

## set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip && \
	pip install psycopg2==2.7.7

WORKDIR /opt
RUN git clone https://github.com/mozilla/http-observatory.git
WORKDIR /opt/http-observatory
RUN pip install --upgrade -r requirements.txt \
	&& pip install .
# default: localhost; windows only
ENV HOST host.docker.internal 
ENV HTTP_PORT 4200
ENV HTTPS_PORT 443
ENV HEADERS {\"X-Foo\": \"bar\"}
ENV COOKIES {\"foo\": \"bar\"}

CMD httpobs/scripts/httpobs-local-scan --http-port ${HTTP_PORT} --https-port ${HTTPS_PORT} --path '/' \
	--cookies "${COOKIES}" --headers "${HEADERS}" --no-verify ${HOST} > /data/result_$(date +"%Y%m%d%H%M%S").json
