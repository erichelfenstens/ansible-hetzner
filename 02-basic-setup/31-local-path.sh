#!/bin/sh
#=============================================================================
# Copyright Luiz Carlos Faria 2022. All Rights Reserved.
# This file is licensed under the MIT License.
# License text available at https://opensource.org/licenses/MIT
#=============================================================================

echo "---------------------------------------------------"
echo "Instalando Rancher Local Path Provisioner"
echo "---------------------------------------------------"

kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/v0.0.22/deploy/local-path-storage.yaml
