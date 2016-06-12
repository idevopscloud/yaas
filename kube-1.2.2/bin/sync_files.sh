#!/bin/bash

. $YAAS_CONFDIR/yaas.conf

if [ $# -ge 1 ]; then
    node_list=$@
else
    node_list=$(kubectl get node | tail -n +2 | awk {'print$1'})
fi

for node in $node_list
do
    echo "start sync files for $node"
    $COPY_CMD -r $YAAS_ROOT/* $node:$YAAS_ROOT/
    echo "end sync files for $node"
done

