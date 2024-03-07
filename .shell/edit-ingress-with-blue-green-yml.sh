#!/bin/bash

BLUEGREEN=$1

if [ "$BLUEGREEN" == "blue" ]; then
    SERVICE_NAME=${SERVICE_BLUE_NAME}
elif [ "$BLUEGREEN" == "green" ]; then
    SERVICE_NAME=${SERVICE_GREEN_NAME}
else
    echo "Invalid value for BLUEGREEN. Expected 'blue' or 'green'. Exiting with an error."
    exit 1
fi

chmod +x ./.shell/edit-ingress-yml.sh && ./.shell/edit-ingress-yml.sh

yq eval -i "
    .spec.rules[0].http.paths[1].path = \"${INGRESS_BLUE_PATH}\" |
    .spec.rules[0].http.paths[1].pathType = \"Prefix\" |
    .spec.rules[0].http.paths[1].backend.service.name = \"${SERVICE_BLUE_NAME}\" |
    .spec.rules[0].http.paths[1].backend.service.port.number = 80 |
    .spec.rules[0].http.paths[2].path = \"${INGRESS_GREEN_PATH}\" |
    .spec.rules[0].http.paths[2].pathType = \"Prefix\" |
    .spec.rules[0].http.paths[2].backend.service.name = \"${SERVICE_GREEN_NAME}\" |
    .spec.rules[0].http.paths[2].backend.service.port.number = 80
" ${INGRESS_FILE}