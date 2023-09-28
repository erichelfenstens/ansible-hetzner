#!/bin/sh
#=============================================================================
# Copyright Luiz Carlos Faria 2022. All Rights Reserved.
# This file is licensed under the MIT License.
# License text available at https://opensource.org/licenses/MIT
#=============================================================================

echo "---------------------------------------------------"
echo "Instalando Rancher LongHorn"
echo "---------------------------------------------------"

kubectl apply -f "https://raw.githubusercontent.com/longhorn/longhorn/v1.4.1/deploy/longhorn.yaml"

kubectl set env --namespace longhorn-system deployment/longhorn-driver-deployer KUBELET_ROOT_DIR=/var/snap/microk8s/common/var/lib/kubelet

echo " "
echo "aguardando criação de recursos..."
echo " "

kubectl -n longhorn-system wait --timeout=5m --for=condition=Available deployments longhorn-ui

echo " "
echo "recursos criados!"
echo " "

kubectl apply -f ./30-longhorn
