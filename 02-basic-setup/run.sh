#!/bin/sh
#=============================================================================
# Copyright Luiz Carlos Faria 2022. All Rights Reserved.
# This file is licensed under the MIT License.
# License text available at https://opensource.org/licenses/MIT
#=============================================================================

for f in ./*.sh; do

    if [ "$f" != "./run.sh" ]; then

        # echo "--------------------------------------------------- $f begin {"

        . "$f"

        #  echo "--------------------------------------------------- $f end }"

    fi
done

# clear && ./run.sh
# clear && kubectl get all --all-namespaces
