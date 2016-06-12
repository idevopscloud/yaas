#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $DIR/conf/yaas.conf

echo $YAAS_ROOT

export YAAS_VERSION
export YAAS_ROOT
export YAAS_MASTER
export YAAS_BINDIR=$YAAS_ROOT/$YAAS_VERSION/bin
export YAAS_LIBDIR=$YAAS_ROOT/$YAAS_VERSION/lib
export YAAS_SERVERDIR=$YAAS_ROOT/$YAAS_VERSION/etc
export YAAS_CONFDIR=$YAAS_ROOT/conf
export YAAS_LOGDIR="/var/log/yaas"
export YAAS_WORKDIR="/var/lib/yaas"

export PATH=${YAAS_BINDIR}:${YAAS_SERVERDIR}:$PATH

mkdir ${YAAS_LOGDIR} 2>/dev/null
mkdir ${YAAS_WORKDIR} 2>/dev/null

