#!/bin/sh
#=============================================================================
# Copyright Luiz Carlos Faria 2022. All Rights Reserved.
# This file is licensed under the MIT License.
# License text available at https://opensource.org/licenses/MIT
#=============================================================================

echo "---------------------------------------------------"
echo "Gerando informações úteis"
echo "---------------------------------------------------"
echo
echo "Dashboard"
echo "https://95.216.203.205:30777/"
echo
kubectl -n kubernetes-dashboard create token admin-user
echo
echo "---------------------------------------------------"
echo
echo "Rancher Longhorn"
echo "http://95.216.203.205:30778/"
echo
echo "---------------------------------------------------"
#kubectl proxy
