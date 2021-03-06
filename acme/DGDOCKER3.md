---
Host: dgdocker3.grinnell.edu
Service: acme
---

This document should be used to launch the `acme` service on host `dgdocker3.grinnell.edu`.

> Note that this process should be started FIRST when relaunching the application stack on any host!

## Preparation

Before entering the prescribed "Command Sequence", below, the user should take steps to...

  - Specify subdmain/domain for which certificate is to be generated: variable MYSITE
  - Comment out one of the `CASERVER=` specifications.  Comment out the second one (includes 'staging') for **production**, or the first one for **testing/staging**.
  - Make sure that the `-d`, `--key-file`, and `--cert-file` flags all specify `dgdocker3.grinnell.edu`.

## Command Sequence

  - MYSITE=subdmain.mysite.tls
  - CASERVER=https://acme-v02.api.letsencrypt.org/directory  
  - CASERVER=https://acme-staging-v02.api.letsencrypt.org/directory  
  - docker network create proxy  
  - cd ~/host/acme  
  - docker-compose up -d; docker-compose logs  
  - docker exec -it acme --issue --dns dns_azure --server ${CASERVER} -d dgdocker3.grinnell.edu --domain-alias _acme-challenge.leverify.info --key-file /certs/${}.key --cert-file /certs/dgdocker3.grinnell.edu.cert --standalone --force  
  - docker exec -it acme --issue --dns dns_cf --server ${CASERVER} -d ${MYSITE} --domain-alias _acme-challenge.leverify.info --key-file /certs/${MYSITE}.key --cert-file /certs/${MYSITE}.cert --standalone --force  



