#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

pushd "$SCRIPT_DIR" > /dev/null

# Tweak the NGINX config to use host.docker.internal instead of localhost,
# so that the NGINX container can proxy requests back to the dev server and
# the API server running on the host machine i.e. the dev instances.
# This is then used by the nginx in the docker-compose file.
cat "../nginx.conf" | sed "s/localhost/host.docker.internal/g" > "./nginx.dev.conf"

docker compose down
docker compose up
docker compose down

popd > /dev/null
