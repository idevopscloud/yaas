#!/bin/bash

. $YAAS_ROOT/yaas.conf
. $YAAS_LIBDIR/utils.sh

log "start etcd on hosts <$ETCD_HOSTS>"

mkdir /tmp/yaas/

rm /tmp/yaas/etcd_hosts
echo "[etcd_hosts]" > /tmp/yaas/etcd_hosts

for etcd_host in ${ETCD_HOSTS}
do
    log "etcd_host = $etcd_host"
    echo $etcd_host >> /tmp/yaas/etcd_hosts
done

ansible-playbook -i /tmp/yaas/etcd_hosts $YAAS_ROOT/$YAAS_VERSION/conf/start.yml

