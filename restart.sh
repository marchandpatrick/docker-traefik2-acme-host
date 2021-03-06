#!/bin/bash
#
docker network create proxy
cd ~/host/acme
# List of site to be updated
docker-compose up -d; docker-compose logs
#docker exec -it acme --issue --dns dns_azure --server https://acme-staging-v02.api.letsencrypt.org/directory -d static.grinnell.edu -d rootstalk.grinnell.edu -d vaf.grinnell.edu -d vaf-kiosk.grinnell.edu --domain-alias _acme-challenge.leverify.info --key-file /certs/static.grinnell.edu.key --cert-file /certs/static.grinnell.edu.cert --standalone --force
docker exec -it acme --issue --dns dns_cf --server https://acme-staging-v02.api.letsencrypt.org/directory -d mysite1.tk -d *.mysite1.tk -d mysite2.tk -d  --domain-alias _acme-challenge.leverify.info  --standalone --force
#
cd ../traefik
docker-compose up -d; docker-compose logs
cd ../whoami
docker-compose up -d; docker-compose logs
#
#cd ../watchtower
#docker-compose up -d; docker-compose logs
#cd ../portainer
#docker-compose up -d; docker-compose logs
#
## For DGDocker3.Grinnell.edu...
#cd ../landing
#docker-compose up -d; docker-compose logs
#
## For Static.Grinnell.edu...
# cd ../static-landing-page
# docker-compose up -d; docker-compose logs
# cd ../rootstalk-static
# docker-compose up -d; docker-compose logs
# cd ../vaf
# docker-compose up -d; docker-compose logs
# docker-compose --file docker-compose.kiosk.yml up -d; docker-compose logs
#
echo "Dumping traefik.log..."
docker exec -it traefik cat /var/log/traefik.log
