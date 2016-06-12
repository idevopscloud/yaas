#!/bin/bash

. $YAAS_LIBDIR/utils.sh

if ! $YAAS_BINDIR/start-flanneld-local.sh; then
    exit 1
fi

if ! $YAAS_BINDIR/start-docker.sh; then
    exit 1
fi

if ! $YAAS_BINDIR/start-kube-minion.sh; then
    exit 1
fi
$YAAS_BINDIR/start-paas-agent.sh
