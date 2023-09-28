#!/bin/sh
#=============================================================================
# Copyright Luiz Carlos Faria 2022. All Rights Reserved.
# This file is licensed under the MIT License.
# License text available at https://opensource.org/licenses/MIT
#=============================================================================

echo "---------------------------------------------------"
echo "Instalando cert-manager"
echo "---------------------------------------------------"

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.9.1/cert-manager.yaml

echo " "
echo "aguardando criação de recursos..."
echo " "

kubectl -n cert-manager wait --timeout=5m --for=condition=Available deployments cert-manager

echo " "
echo "recursos criados!"
echo " "
