#!/bin/bash

yq eval -i "
    .metadata.name = \"${DEPLOYMENT_NAME}\" |
    .metadata.namespace = \"${KUBERNETES_NAMESPACE}\" |
    .spec.replicas = ${DEPLOYMENT_REPLICAS} |
    .spec.selector.matchLabels.app = \"${DEPLOYMENT_SELECTOR_NAME}\" |
    .spec.template.metadata.labels.app = \"${DEPLOYMENT_SELECTOR_NAME}\" |
    .spec.template.spec.containers[0].name = \"${DEPLOYMENT_POD_NAME}\" |
    .spec.template.spec.containers[0].image = \"${DEPLOYMENT_POD_IMAGE}\" |
    .spec.template.spec.containers[0].env[0].name = \"${DEPLOYMENT_POD_ENV_NAME_0}\" |
    .spec.template.spec.containers[0].env[0].value = \"${DEPLOYMENT_POD_ENV_VALUE_0}\" |
    .spec.template.spec.containers[0].env[1].name = \"${DEPLOYMENT_POD_ENV_NAME_1}\" |
    .spec.template.spec.containers[0].env[1].value = \"${DEPLOYMENT_POD_ENV_VALUE_1}\" |
    .spec.template.spec.imagePullSecrets[0].name = \"${DEPLOYMENT_DOCKER_REGISTRY_SECRET}\"
" ${DEPLOYMENT_FILE}