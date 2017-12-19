#!/bin/bash
set -e

# capture anonymous metrics for reporting
curl https://mesosphere.com/wp-content/themes/mesosphere/library/images/assets/sdk/build-sh-start.png >/dev/null 2>&1

FRAMEWORK_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BUILD_DIR=$FRAMEWORK_DIR/build/distributions
PUBLISH_STEP=${1-none}
export REPO_NAME="$(basename $FRAMEWORK_DIR)"
export BUILD_BOOTSTRAP=no
export TOOLS_DIR=${FRAMEWORK_DIR}/tools
#export CLI_DIR=${FRAMEWORK_DIR}/cli
export ORG_PATH=github.com/$REPO_NAME
export BOOTSTRAP_DIR=disable
export EXECUTOR_DIR=disable
${FRAMEWORK_DIR}/tools/build_framework.sh $REPO_NAME $FRAMEWORK_DIR $PUBLISH_STEP --artifact $BUILD_DIR/$REPO_NAME-scheduler.zip

# capture anonymous metrics for reporting
curl https://mesosphere.com/wp-content/themes/mesosphere/library/images/assets/sdk/build-sh-finish.png >/dev/null 2>&1
