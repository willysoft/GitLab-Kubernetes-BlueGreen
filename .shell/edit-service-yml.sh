#!/bin/bash

yq eval -i "
    .metadata.name = \"${SERVICE_NAME}\" |
    .metadata.namespace = \"${KUBERNETES_NAMESPACE}\" |
    .spec.selector.app = \"${SERVICE_SELECTOR_NAME}\"
" ${SERVICE_FILE}