#!/usr/bin/env bash
helm upgrade metrics-dashboard stable/prometheus-operator  --set prometheusOperator.createCustomResource=false \
--set grafana.ingress.hosts={"grafana.***REMOVED***.k8.***REMOVED***.com"} --namespace monitoring \
--set grafana.ingress.enabled=true \
--set grafana.ingress.annotations."kubernetes\.io/ingress\.class"=nginx-internal \
--set grafana.ingress.annotations."kubernetes\.io/tls-acme"=\"true\" \
--set grafana.ingress.tls\[0\].hosts={"grafana.***REMOVED***.k8.***REMOVED***.com"} \
--set grafana.ingress.tls\[0\].secretName=grafana-tls-cert \
--set grafana.ingress.annotations."cert-manager\.io/cluster-issuer"=selfsigned-issuer \
--set prometheus.ingress.hosts={"prometheus.***REMOVED***.k8.***REMOVED***.com"} \
--set prometheus.ingress.enabled=true \
--set prometheus.ingress.annotations."kubernetes\.io/ingress\.class"=nginx-internal \
--set prometheus.ingress.annotations."kubernetes\.io/tls-acme"=\"true\" \
--set prometheus.ingress.tls\[0\].hosts={"prometheus.***REMOVED***.k8.***REMOVED***.com"} \
--set prometheus.ingress.tls\[0\].secretName=grafana-tls-cert


helm upgrade sonarqube oteemocharts/sonarqube \
--set ingress.hosts\[0\].name="sonar.***REMOVED***.k8.***REMOVED***.com" --set ingress.hosts\[0\].path="/" \
--namespace sonar --set ingress.enabled=true \
--set ingress.annotations."kubernetes\.io/ingress\.class"=nginx-internal \
--set ingress.annotations."kubernetes\.io/tls-acme"=\"true\" \
--set ingress.annotations."cert-manager\.io/cluster-issuer"=selfsigned-issuer \
--set ingress.tls\[0\].hosts={"sonar.***REMOVED***.k8.***REMOVED***.com"} \
--set ingress.tls\[0\].secretName=sonarqube-tls-cert \
--set image.tag="latest"


helm upgrade elk stable/elastic-stack --namespace sonar \
--set kibana.ingress.hosts={"kibana.***REMOVED***.k8.***REMOVED***.com"}  \
--set kibana.ingress.enabled=true \
--set kibana.ingress.annotations."kubernetes\.io/ingress\.class"=nginx-internal \
--set kibana.ingress.annotations."kubernetes\.io/tls-acme"=\"true\" \
--set kibana.ingress.tls\[0\].hosts={"kibana.***REMOVED***.k8.***REMOVED***.com"} \
--set kibana.ingress.tls\[0\].secretName=dashboard-tls-cert \
--set fluentd.enabled=false --set fluent-bit.enabled=false --set fluent.elasticsearch.enabled=false \
--set logstash.enabled=true --set logstash.elasticsearch.host="elasticsearch.***REMOVED***.k8.***REMOVED***.com" \
--set filebeat.enabled=true --set filebeat.plugins={"nginx"} \
--set filebeat.config.http.enabled=false \
--set elasticsearch.client.ingress.hosts={"elasticsearch.***REMOVED***.k8.***REMOVED***.com"}  \
--set elasticsearch.client.ingress.enabled=true \
--set elasticsearch.client.ingress.annotations."kubernetes\.io/ingress\.class"=nginx-internal \
--set elasticsearch.client.ingress.annotations."kubernetes\.io/tls-acme"=\"true\" \
--set elasticsearch.client.ingress.tls\[0\].hosts={"elasticsearch.***REMOVED***.k8.***REMOVED***.com"} \
--set elasticsearch.client.ingress.tls\[0\].secretName=dashboard-tls-cert


helm upgrade elk stable/elastic-stack --namespace sonar \
--set ingress.hosts={"elasticsearch.***REMOVED***.k8.***REMOVED***.com"}  \
--set ingress.enabled=true \
--set ingress.annotations."kubernetes\.io/ingress\.class"=nginx-internal \
--set ingress.annotations."kubernetes\.io/tls-acme"=\"true\" \
--set ingress.tls\[0\].hosts={"elasticsearch.***REMOVED***.k8.***REMOVED***.com"} \
--set ingress.tls\[0\].secretName=dashboard-tls-cert


helm upgrade kibana  elastic/kibana --namespace monitoring  \
--set ingress.hosts={"kibana.***REMOVED***.k8.***REMOVED***.com"}  \
--set ingress.enabled=true \
--set ingress.annotations."kubernetes\.io/ingress\.class"=nginx-internal \
--set ingress.annotations."kubernetes\.io/tls-acme"=\"true\" \
--set ingress.tls\[0\].hosts={"kibana.***REMOVED***.k8.***REMOVED***.com"} \
--set ingress.tls\[0\].secretName=kibana-tls-cert \
--set ingress.annotations."cert-manager\.io/cluster-issuer"=selfsigned-issuer


helm install --name  elasticsearch elastic/elasticsearch --namespace monitoring  \
--set ingress.hosts={"elasticsearch.***REMOVED***.k8.***REMOVED***.com"}  --set ingress.enabled=true \
--set ingress.annotations."kubernetes\.io/ingress\.class"=nginx-internal \
--set ingress.annotations."kubernetes\.io/tls-acme"=\"true\" \
--set ingress.tls\[0\].secretName=elasticsearch-tls-cert \
--set ingress.annotations."cert-manager\.io/cluster-issuer"=selfsigned-issuer



helm install --name apm-server elastic/apm-server --namespace monitoring

helm install --name fluent-bit  stable/fluent-bit --namespace monitoring \
--set backend.type="es" \
--set backend.es.host="elasticsearch-master" \
--set dnsPolicy=ClusterFirstWithHostNet



helm upgrade kubernetes-dashboard  stable/kubernetes-dashboard --namespace kube-system  \
--set ingress.hosts={"dashboard.***REMOVED***.k8.***REMOVED***.com"}  \
--set ingress.enabled=true \
--set ingress.annotations."kubernetes\.io/ingress\.class"=nginx-internal \
--set ingress.annotations."kubernetes\.io/tls-acme"=\"true\" \
--set ingress.tls\[0\].hosts={"dashboard.***REMOVED***.k8.***REMOVED***.com"} \
--set ingress.tls\[0\].secretName=dashboard-tls-cert \
--set ingress.annotations."cert-manager\.io/cluster-issuer"=selfsigned-issuer \
--set ingress.annotations."nginx\.ingress\.kubernetes\.io/backend-protocol"=HTTPS \
--set enableSkipLogin=true



helm upgrade autoscaler stable/cluster-autoscaler \
--set autoDiscovery.clusterName=***REMOVED***infra2-cluster-dev --set autoDiscovery.tags\[2\]="kubernetes\.io/cluster/***REMOVED***infra2-cluster-dev"  \
--set rbac.create=true  \
--namespace sonar
