# tritonmedia Helm Chart

[Tritonmedia](https://github.com/tritonmedia/triton) is an open source media processing pipeline and media center

## TL;DR;

```console
$ helm install .
```

## Introduction

This chart bootstraps a [Triton](https://github.com/tritonmedia/triton) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm install --name my-release .
```

The command above deploys Triton on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete --purge my-release
```

The command above removes all the Kubernetes components associated with the chart and deletes the release.

## Contents

This helm chart installs:

 * [twilight](https://github.com/tritonmedia/twilight.go) - media organizer
 * [events](https://github.com/tritonmedia/events) - API gateway
 * [identifier](https://github.com/tritonmedia/identifier) - media identification and subtitle downloading service
 * [downloader](https://github.com/tritonmedia/downloader) - media downloader service
 * [converter](https://github.com/tritonmedia/converter) - media converting service
 * [player](https://github.com/tritonmedia/player) - WIP media player (replaces jellyfin/plex)
 * [Jellyfin](https://jellyfin.media) - media frontend
 * [Plex](https://plex.tv) - media frontend
 * RabbitMQ - used for job processing
 * PostgreSQL - used for data storage

## Configuration

The following table lists the configurable parameters of the Cloudserver chart and their default values.

Parameter | Description | Default
--------- | ----------- | -------
`endpoints.plex` | Endpoint to expose plex | ``
`endpoints.jellyfin` | Endpoint to expose jellyfin | ``
`endpoints.events` | Endpoint to expose triton's api gateway | `true`
`config[microservice].replicas` | Number of replicas for this microservice | `1`
`config[microservice].nodeSelector` | Node Selector for this microservice | `{}`
`config[microservice].resources` | Resources for this microservice | `{}`
`config[microservice].tolerations` | Tolerations for this microservice | `[]`
`config[microservice].environment` | Deprecated field to control `NODE_ENV` | `production`
`config[microservice].imageTag` | Image tag to use | `prod`
`config[microservice].imageRepository` | Image repos to use | `jaredallard/triton-$name`
`config[microservice].imagePullPolicy` | Image Pull Policy | `IfNotPresent`
`postgres` | Postgres Configuration | `{}`
`rabbitmq` | RabbitMQ Configuration | `{}`

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install . --name my-release \
    --set endpoints.plex=plex.tritonjs.com
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
$ helm install . --name my-release -f values.yaml
```

> **Tip**: You can use the default [values.yaml](values.yaml)