#!/bin/bash

. $YAAS_LIBDIR/utils.sh

log "Start paas-agent ..."
python $YAAS_SERVERDIR/paas-agent.py $MY_IP 12305 &

