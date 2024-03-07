#!/bin/bash

BLUEGREEN=$1
BLUEGREEN_LIVE=$2

if [ "$BLUEGREEN" == "blue" ]; then
    DEPLOYMENT_NAME=${DEPLOYMENT_BLUE_NAME}
    DEPLOYMENT_SELECTOR_NAME=${DEPLOYMENT_BLUE_SELECTOR_NAME}
elif [ "$BLUEGREEN" == "green" ]; then
    DEPLOYMENT_NAME=${DEPLOYMENT_GREEN_NAME}
    DEPLOYMENT_SELECTOR_NAME=${DEPLOYMENT_GREEN_SELECTOR_NAME}
else
    echo "Invalid value for BLUEGREEN. Expected 'blue' or 'green'. Exiting with an error."
    exit 1
fi

if [ "$BLUEGREEN_LIVE" != "true" ] && [ "$BLUEGREEN_LIVE" != "false" ]; then
    echo "Invalid value for BLUEGREEN_LIVE. Expected 'true' or 'false'. Exiting."
    exit 1
fi

chmod +x ./.shell/edit-deployment-yml.sh && ./.shell/edit-deployment-yml.sh

yq eval -i "
    .metadata.annotations.\"bluegreen/live\" = \"${BLUEGREEN_LIVE}\"
" ${DEPLOYMENT_FILE}