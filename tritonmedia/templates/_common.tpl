{{/*
  Generate the jaeger container.
*/}}
{{- define "includeJaegerContainer" -}}
- image: jaegertracing/jaeger-agent
  name: jaeger-agent
  ports:
  - containerPort: 5775
    protocol: UDP
  - containerPort: 6831
    protocol: UDP
  - containerPort: 6832
    protocol: UDP
  - containerPort: 5778
  command:
  - "/go/bin/agent-linux"
  - "--collector.host-port=jaeger-collector.default:14267"
{{- end -}}
