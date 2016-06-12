. $YAAS_CONFDIR/yaas.conf

log_file="$YAAS_LOGDIR/ops.log"

log_debug()
{
    local msg=$*
    python $YAAS_LIBDIR/log.py "DEBUG" "$msg"
}

log_info()
{
    local msg=$*
    python $YAAS_LIBDIR/log.py "info" "$msg"
}

log_warnning()
{
    local msg=$*
    python $YAAS_LIBDIR/log.py "warnning" "$msg"
}

log_error()
{
    local msg=$*
    python $YAAS_LIBDIR/log.py "error" "$msg"
}

log_critical()
{
    local msg=$*
    python $YAAS_LIBDIR/log.py "critical" "$msg"
}

log()
{
    if [  ! -f $log_file ]; then
        touch $log_file
    fi

    local file_size=`ls -s $log_file | awk '{print$1}'`
    if [ $file_size -ge 1024000 ];
    then
        echo "[`date '+%Y-%m-%d %H:%M:%S'`] begin" > $log_file
    fi  

    local msg=$*    
    local line="[`date '+%Y-%m-%d %H:%M:%S'`] "$msg""
    echo ${line} >> $log_file
    echo ${line}
}

is_binary_running()
{
    c=$(ps -ef | grep -c "$1")
    if [ $c -ge 2 ]; then
        return 0
    else
        return 1
    fi
}

MY_IP=$(python $YAAS_LIBDIR/my-ip.py "${YAAS_MASTER} ${YAAS_NODES}")
if [ "$MY_IP" == "" ]; then
    echo "Who am I ? Exiting ..."
    exit 1
fi

