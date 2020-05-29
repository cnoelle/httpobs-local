# httpobs-local
Run Mozillas http-observatory locally in a Docker container

## Prerequisites
Docker installed. 

## Usage
Build docker image: `./build.sh` 

Run: `HOST=<HOST> HTTP_PORT=<PORT> (HTTPS_PORT=<HTTPS_PORT>) ./run.sh`

Results will be written to json files in the folder `results`.

## Examples
Run against public site:
```
HOST=google.com HTTP_PORT=80 HTTPS_PORT=443 ./run.sh
```

Run against site on localhost:
```
HOST=host.docker.internal HTTP_PORT=4200 ./run.sh
```
Note that this should only work on Windows, on Linux you need to figure out the host's IP address somehow...