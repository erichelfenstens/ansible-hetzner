#!/bin/sh
#=============================================================================
# Copyright Luiz Carlos Faria 2022. All Rights Reserved.
# This file is licensed under the MIT License.
# License text available at https://opensource.org/licenses/MIT
#=============================================================================

echo "---------------------------------------------------"
echo "Instalando dashboard"
echo "---------------------------------------------------"

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.6.1/aio/deploy/recommended.yaml

echo " "
echo "aguardando criação de recursos..."
echo " "

kubectl -n kubernetes-dashboard wait --timeout=5m --for=condition=Available deployments kubernetes-dashboard

echo " "
echo "recursos criados!"
echo " "

kubectl apply -f ./05-dashboard

echo " "
echo "Aumentando tempo de espera do Dashboard Kubernetes"
echo " "

#12 horas
kubectl patch --namespace kubernetes-dashboard deployment kubernetes-dashboard --type='json' --patch \
    '[{"op": "add", "path": "/spec/template/spec/containers/0/args/2", "value": "--token-ttl=43200" }]'

echo " "
echo "recursos criados!"
echo " "
