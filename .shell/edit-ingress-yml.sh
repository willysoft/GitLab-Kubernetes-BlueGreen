#!/bin/bash

yq eval -i "
    .metadata.name = \"${INGRESS_NAME}\" |
    .metadata.namespace = \"${KUBERNETES_NAMESPACE}\" |
    .spec.rules[0].http.paths[0].path = \"${INGRESS_PATH}\" |
    .spec.rules[0].http.paths[0].backend.service.name = \"${SERVICE_NAME}\"
" ${INGRESS_FILE}