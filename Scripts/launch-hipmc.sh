#!/bin/sh
# shellcheck disable=SC2086

set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
CONTENT_DIR=$(dirname "${SCRIPT_DIR}")

DOCKER_ARGS=${DOCKER_ARGS:--it}
CMD=${1:-bash}

exec docker run \
	--rm \
	${DOCKER_ARGS} \
	--name hip-examples \
	-h hip-examples \
	--device /dev/kfd --device /dev/dri \
	-v "${CONTENT_DIR}":/workspaces/hip-examples \
	rocm-examples "$CMD"
