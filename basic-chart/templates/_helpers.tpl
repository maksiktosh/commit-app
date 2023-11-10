{{/*
Expand the name of the chart.
*/}}
{{- define "test-max-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "test-max-chart.fullname" -}}
max-pod
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "test-max-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "test-max-chart.labels" -}}
env: {{ include "test-max-chart.fullname" . }}
helm.sh/chart: {{ include "test-max-chart.chart" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "test-max-chart.selectorLabels" -}}
app: {{ include "test-max-chart.fullname" . }}
app.kubernetes.io/name: {{ include "test-max-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "test-max-chart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "test-max-chart.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Namespace
*/}}
{{- define "test-max-chart.namespace" -}}
test-max
{{- end }}

{{/*
Imagename
*/}}
{{- define "test-max-chart.imagename" -}}
nginx
{{- end }}

{{/*
Vars
*/}}
{{- define "test-max-chart.varsname" -}}
vars-conf
{{- end }}

{{/*
Configmapname
*/}}
{{- define "test-max-chart.configmapname" -}}
max-vars
{{- end }}

{{/*
Configmapname2
*/}}
{{- define "test-max-chart.configmapname2" -}}
max-vars-conf
{{- end }}