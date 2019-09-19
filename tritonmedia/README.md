# tritonmedia Helm Chart

[Triton](https://github.com/tritonmedia/triton) is an open source media processing pipeline and media center

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
`endpoints.events` | Endpoint to expose triton's api gateway | ``
`services[microservice].replicas` | Number of replicas for this microservice | `1`
`services[microservice].nodeSelector` | Node Selector for this microservice | `{}`
`services[microservice].resources` | Resources for this microservice | `{}`
`services[microservice].tolerations` | Tolerations for this microservice | `[]`
`services[microservice].environment` | Deprecated field to control `NODE_ENV` | `production`
`services[microservice].imageTag` | Image tag to use | `prod`
`services[microservice].imageRepository` | Image repos to use | `jaredallard/triton-$name`
`services[microservice].imagePullPolicy` | Image Pull Policy | `IfNotPresent`
`services.converter.settings.video` | Video converting options | `{}`
`services.converter.settings.audio` | Audio converting options | `{}`
`services.converter.settings.subtitles` | Subtitle converting options | `{}`
`s3.accessKey` | Access Key for S3 | `''`
`s3.secretKey` | Secret Key for S3 | `''`
`trello.enabled` | Enable Trello Integration | `false`
`trello.token` | Token to Access Trello | `''`
`trello.key` | Key to Access Trello | `''`
`trello.flow_ids` | Map of flow_ids to trello lists | `{}`
`trello.labels` | Map of internal label names to ids | `{}`
`trello.boardID` | ID of the board to use | `{}`
`telegram.enabled` | Enable telegram notifications | `false`
`telegram.token` | Token to use to connect to telegram | `''`
`telegram.channel` | Channel to send Telegram notifications to | `''`
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

## Troubleshooting

### RabbitMQ Authentication Issues

For some reason the chart doesn't actually bootstrap RabbitMQ properly. Shell into the pod and change the password to the expected default.

```bash
$ kubectl exec -it triton-rabbitmq-0 sh -- -c "rabbitmqctl change_password user bitnami"
```