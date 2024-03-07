#!/bin/bash

BLUEGREEN=$1

if [ "$BLUEGREEN" == "blue" ]; then
    SERVICE_NAME=${SERVICE_BLUE_NAME}
    SERVICE_SELECTOR_NAME=${SERVICE_BLUE_SELECTOR_NAME}
elif [ "$BLUEGREEN" == "green" ]; then
    SERVICE_NAME=${SERVICE_GREEN_NAME}
    SERVICE_SELECTOR_NAME=${SERVICE_GREEN_SELECTOR_NAME}
else
    echo "Invalid value for BLUEGREEN. Expected 'blue' or 'green'. Exiting with an error."
    exit 1
fi

chmod +x ./.shell/edit-service-yml.sh && ./.shell/edit-service-yml.sh