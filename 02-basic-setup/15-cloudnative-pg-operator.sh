#!/bin/sh
#=============================================================================
# Copyright Luiz Carlos Faria 2022. All Rights Reserved.
# This file is licensed under the MIT License.
# License text available at https://opensource.org/licenses/MIT
#=============================================================================

echo "---------------------------------------------------"
echo "Instalando cloudnative-pg (Operator de Cluster Postgres)"
echo "---------------------------------------------------"

kubectl apply -f https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/release-1.19/releases/cnpg-1.19.1.yaml

echo " "
echo "aguardando criação de recursos..."
echo " "

kubectl -n cnpg-system wait --timeout=5m --for=condition=Available deployments cnpg-controller-manager

echo " "
echo "recursos criados!"
echo " "
