#!/bin/bash -x

DOMAIN=YOUR_DOMAIN

firewall-cmd --add-service=http         && \
~/.acme.sh/acme.sh --renew -d ${DOMAIN} --force --ecc      && \
~/.acme.sh/acme.sh --installcert -d ${DOMAIN} --fullchainpath /etc/v2ray/v2ray.crt --keypath /etc/v2ray/v2ray.key --ecc    && \
firewall-cmd --reload

