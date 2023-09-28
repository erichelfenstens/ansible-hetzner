#!/bin/sh
#=============================================================================
# Copyright Luiz Carlos Faria 2022. All Rights Reserved.
# This file is licensed under the MIT License.
# License text available at https://opensource.org/licenses/MIT
#=============================================================================

echo "---------------------------------------------------"
echo "Instalando RabbitMQ cluster-operator"
echo "---------------------------------------------------"

kubectl apply -f "https://github.com/rabbitmq/cluster-operator/releases/latest/download/cluster-operator.yml"

echo " "
echo "aguardando criação de recursos..."
echo " "

kubectl -n rabbitmq-system wait --timeout=5m --for=condition=Available deployments rabbitmq-cluster-operator

echo " "
echo "recursos criados!"
echo " "

echo "---------------------------------------------------"
echo "Instalando RabbitMQ messaging-topology-operator"
echo "---------------------------------------------------"

kubectl apply -f "https://github.com/rabbitmq/messaging-topology-operator/releases/latest/download/messaging-topology-operator-with-certmanager.yaml"

echo " "
echo "aguardando criação de recursos..."
echo " "

kubectl -n rabbitmq-system wait --timeout=5m --for=condition=Available deployments messaging-topology-operator

echo " "
echo "recursos criados!"
echo " "
