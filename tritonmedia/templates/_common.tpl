{{/*
  Generate the jaeger container.
*/}}
{{- define "includeJaegerContainer" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "service.fullname" -}}
{{- $name := .Name -}}
{{- printf "%s-%s" .Global.Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}