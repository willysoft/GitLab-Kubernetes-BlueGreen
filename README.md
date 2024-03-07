# Continuous Deployment with GitLab CI/CD

This repository contains GitLab CI/CD configuration for continuous deployment of a Kubernetes application. Below is a breakdown of the various stages and jobs defined in the `.gitlab-ci.yml` file.

## Jobs Overview

### Semantic Release

- **Stage:** release
- **Rules:** Triggered on main branch and if `$SEMANTIC_RELEASE` is true
- **Description:** Executes semantic release to automate versioning and changelog generation.

### Docker Build and Push

#### docker-push-production

- **Stage:** release
- **Rules:** Triggered on main branch
- **Description:** Builds and pushes Docker images to production registry.

#### docker-push-development

- **Stage:** release
- **Rules:** Triggered on merge request
- **Description:** Builds and pushes Docker images to development registry.

### Kubernetes Deployment

#### kubernetes-deploy-production-blue

- **Stage:** deploy
- **Rules:** Triggered on main branch
- **Description:** Deploys blue version of the application to production.

#### kubernetes-deploy-production-green

- **Stage:** deploy
- **Rules:** Triggered on main branch
- **Description:** Deploys green version of the application to production.

#### kubernetes-ingress-switch-production

- **Stage:** ingress
- **Rules:** Triggered on main branch after blue and green deployments
- **Description:** Switches traffic to blue or green deployment based on annotations.

#### kubernetes-deploy-development

- **Stage:** deploy
- **Rules:** Triggered on merge request
- **Description:** Deploys application to development environment.

#### kubernetes-stop-development

- **Stage:** deploy
- **Rules:** Manual action triggered on merge request
- **Description:** Stops the development deployment.

### Kubernetes Utilities

#### kubernetes-get-contexts

- **Stage:** manual
- **Description:** Displays available Kubernetes contexts.

#### kubernetes-create-docker-registry-secret

- **Stage:** manual
- **Description:** Creates a Docker registry secret in Kubernetes.

#### kubernetes-ingress-switch-blue-production

- **Stage:** manual
- **Description:** Manually switches traffic to blue deployment in production.

#### kubernetes-ingress-switch-green-production

- **Stage:** manual
- **Description:** Manually switches traffic to green deployment in production.

## Configuration

The configuration is split into reusable templates and job-specific settings. You'll need to fill in specific variables marked as `<VARIABLE_NAME>` before using these configurations.

### Docker Settings

- `DOCKER_REGISTRY`: Your Docker registry URL.
- `DOCKER_REPO`: Your Docker repository name.
- `DOCKER_PASSWORD` and `DOCKER_USERNAME`: Docker registry credentials.

### Kubernetes Settings

- `KUBERNETES_CONTEXT_BASE` and `KUBERNETES_CONTEXT_TAG`: Base and tag for Kubernetes context.
- `KUBERNETES_NAMESPACE`: Kubernetes namespace for deployment.
- `KUBERNETES_INGRESS_IP_ADDRESS`: IP address for Kubernetes ingress.

### Other Settings

- `SEMANTIC_RELEASE`: Set to `true` to enable semantic release.

## Usage

1. Ensure all necessary environment variables are set.
2. Customize Kubernetes deployment files in the `.kubernetes` directory.
3. Update Dockerfile and other relevant files for Docker image building.
4. Commit changes and push to GitLab to trigger CI/CD pipelines.
5. Monitor pipeline progress in GitLab CI/CD interface.
