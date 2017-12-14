echo 'Create directory envalopment....'
mkdir -p /srv/beestorage-swarm/database/configdb
mkdir -p /srv/beestorage-swarm/database/db
mkdir -p /srv/beestorage-swarm/database/router/configdb
mkdir -p /srv/beestorage-swarm/database/router/db
cp -a init_mongodb /srv/beestorage-swarm/
cp database/reset_db.sh /srv/beestorage-swarm/database/
echo 'Finish create directory envalopment....'
