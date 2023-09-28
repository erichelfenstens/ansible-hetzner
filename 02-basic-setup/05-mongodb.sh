#!/bin/sh
#=============================================================================
# Copyright Luiz Carlos Faria 2022. All Rights Reserved.
# This file is licensed under the MIT License.
# License text available at https://opensource.org/licenses/MIT
#=============================================================================

echo "---------------------------------------------------"
echo "Instalação do MongoDB Operator requer HELM"
echo "https://ot-mongodb-operator.netlify.app/"
echo "---------------------------------------------------"

kubectl create namespace mongodb-operator

helm repo add ot-helm https://ot-container-kit.github.io/helm-charts/

helm install mongodb-operator ot-helm/mongodb-operator --namespace mongodb-operator

helm test mongodb-operator --namespace mongodb-operator