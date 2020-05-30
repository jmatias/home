#!/usr/bin/env bash
#helm install --name kibana  elastic/kibana --namespace monitoring  \
#--set ingress.hosts={"kibana.***REMOVED***.k8.***REMOVED***.com"}  \
#--set ingress.enabled=true \
#--set ingress.annotations."kubernetes\.io/ingress\.class"=nginx-internal
#
#
#helm install --name  elasticsearch elastic/elasticsearch --namespace monitoring  \
#--set ingress.hosts={"elasticsearch.***REMOVED***.k8.***REMOVED***.com"}  --set ingress.enabled=true \
#--set ingress.annotations."kubernetes\.io/ingress\.class"=nginx-internal \
#--set volumeClaimTemplate.resources.requests.storage=250Gi
#
#
#helm install --name filebeat elastic/filebeat --namespace monitoring
#
#
#
#helm install --name apm-server elastic/apm-server --namespace monitoring
#helm install --name fluent-bit  stable/fluent-bit --namespace monitoring \
#--set backend.type="es" \
#--set backend.es.host="elasticsearch-master" \
#--set dnsPolicy=ClusterFirstWithHostNet
#
#helm install --name metricbeat elastic/metricbeat --namespace monitoring
#helm install --name logstash elastic/logstash --namespace monitoring
#helm install --name apm-server elastic/apm-server --namespace monitoring
#
#
##!/usr/bin/env bash
#
#helm install --name telemetry stable/prometheus-operator  --set prometheusOperator.createCustomResource=false \
#--set grafana.ingress.hosts={"grafana.***REMOVED***.k8.***REMOVED***.com"} --namespace monitoring \
#--set grafana.ingress.enabled=true \
#--set grafana.persistence.enabled=true \
#--set grafana.replicas=1 \
#--set grafana.ingress.annotations."kubernetes\.io/ingress\.class"=nginx-internal \
#--set prometheus.ingress.hosts={"prometheus.***REMOVED***.k8.***REMOVED***.com"} \
#--set prometheus.ingress.enabled=true \
#--set prometheus.ingress.enabled=true \
#--set prometheus.ingress.annotations."kubernetes\.io/ingress\.class"=nginx-internal


#!/usr/bin/env bash

helm repo add oteemocharts https://oteemo.github.io/charts
## TODO: Automate the generation of authentication tokens.

helm install --name sonarqube oteemocharts/sonarqube --namespace sonar  \
--set ingress.hosts\[0\].name="sonar.***REMOVED***.k8.***REMOVED***.com" \
--set ingress.hosts\[0\].path="/" \
--set ingress.enabled=true --set replicaCount=1 \
--set ingress.annotations."kubernetes\.io/ingress\.class"=nginx-internal \
--set plugins.install\[0\]="https://binaries.sonarsource.com/Distribution/sonar-xml-plugin/sonar-xml-plugin-2.0.1.2020.jar" \
--set plugins.install\[1\]="https://binaries.sonarsource.com/Distribution/sonar-go-plugin/sonar-go-plugin-1.6.0.719.jar"


          dashboards:
            default:
              prometheus-stats:
                gnetId: 10000
                revision: 1
                datasource: Prometheus
              cluster-cost:
                gnetId: 6873
                revision: 2
                datasource: Prometheus
              pod-cost:
                gnetId: 6879
                revision: 1
                datasource: Prometheus
              namespace-cost:
                gnetId: 6876
                revision: 2
                datasource: Prometheus


---
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: blackbox-prometheus-blackbox-exporter-Devhub
  labels:
    app.kubernetes.io/name: prometheus-blackbox-exporter
    app.kubernetes.io/instance: blackbox
    app.kubernetes.io/managed-by: Tiller
    helm.sh/chart: prometheus-blackbox-exporter-3.2.0
spec:
  endpoints:
  - port: http
    scheme: http
    path: "/probe"
    interval: 5s
    scrapeTimeout: 5s
    params:
      module:
      - http_200
      target:
      - https://***REMOVED***-impdh-staging.***REMOVED***.k8.***REMOVED***.com/heartbeat
    metricRelabelings:
      - sourceLabels: [__address__]
        targetLabel: __param_target
      - sourceLabels: [__param_target]
        targetLabel: instance
      - targetLabel: target
        replacement: Devhub
  jobLabel: "blackbox"
  selector:
    matchLabels:
      app.kubernetes.io/name: prometheus-blackbox-exporter
      app.kubernetes.io/instance: blackbox
  namespaceSelector:
    matchNames:
      - monitoring
