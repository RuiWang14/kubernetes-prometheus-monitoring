#!/bin/sh

# Create ConfigMap with Prometheus config
kubectl --namespace monitoring create configmap --dry-run prometheus-core \
  --from-file=configs/prometheus/prometheus.yaml \
  --output yaml \
    > ./manifests/prometheus/configmap.yaml

## Create ConfigMap with prometheus rules for alerting
#kubectl --namespace monitoring create configmap --dry-run prometheus-rules \
#  --from-file=configs/prometheus/rules \
#  --output yaml \
#    > ./manifests/prometheus/prometheus-rules.yaml

# Create one single manifest file
target="./manifests-all.yaml"
rm "$target"
echo "# Derived from ./manifests" >> "$target"
for file in $(find ./manifests -type f -name "*.yaml" | sort) ; do
  echo "---" >> "$target"
  cat "$file" >> "$target"
done
