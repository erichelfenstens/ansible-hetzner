#!/bin/sh
#=============================================================================
# Copyright Luiz Carlos Faria 2022. All Rights Reserved.
# This file is licensed under the MIT License.
# License text available at https://opensource.org/licenses/MIT
#=============================================================================

echo "---------------------------------------------------"
echo "Instalando Portainer Agent"
echo "---------------------------------------------------"

kubectl apply -f ./40-portainer
