#!/bin/bash

[ "$DEBUG" = "true" ] && set -x

# If asked, we'll ensure that the www-data is set to the same uid/gid as the
# mounted volume.  This works around permission issues with virtualbox shared
# folders.
if [[ "$UPDATE_UID_GID" = "true" ]]; then
    echo "Updating www-data uid and gid"

    DOCKER_UID=`stat -c "%u" $MAGENTO_ROOT`
    DOCKER_GID=`stat -c "%g" $MAGENTO_ROOT`

    INCUMBENT_USER=`getent passwd $DOCKER_UID | cut -d: -f1`
    INCUMBENT_GROUP=`getent group $DOCKER_GID | cut -d: -f1`

    echo "Docker: uid = $DOCKER_UID, gid = $DOCKER_GID"
    echo "Incumbent: user = $INCUMBENT_USER, group = $INCUMBENT_GROUP"

    # Once we've established the ids and incumbent ids then we need to free them
    # up (if necessary) and then make the change to www-data.

    [ ! -z "${INCUMBENT_USER}" ] && usermod -u 99$DOCKER_UID $INCUMBENT_USER
    usermod -u $DOCKER_UID www-data

    [ ! -z "${INCUMBENT_GROUP}" ] && groupmod -g 99$DOCKER_GID $INCUMBENT_GROUP
    groupmod -g $DOCKER_GID www-data
fi

# Ensure our Magento directory exists
mkdir -p $MAGENTO_ROOT
chown www-data:www-data $MAGENTO_ROOT


CRON_LOG=/var/log/cron.log

# Setup Magento cron
echo "* * * * * www-data /usr/local/bin/php ${MAGENTO_ROOT}/bin/magento cron:run | grep -v \"Ran jobs by schedule\" >> ${MAGENTO_ROOT}/var/log/magento.cron.log" > /etc/cron.d/magento
echo "* * * * * www-data /usr/local/bin/php ${MAGENTO_ROOT}/update/cron.php >> ${MAGENTO_ROOT}/var/log/update.cron.log" >> /etc/cron.d/magento
echo "* * * * * www-data /usr/local/bin/php ${MAGENTO_ROOT}/bin/magento setup:cron:run >> ${MAGENTO_ROOT}/var/log/setup.cron.log" >> /etc/cron.d/magento
#!/bin/bash

source /etc/apache2/envvars
exec apache2 -D FOREGROUND
