```
curl https://getcaddy.com | bash -s personal http.filemanager,http.forwardproxy,http.proxyprotocol
curl -s https://raw.githubusercontent.com/GEM7/My_scripts/master/caddy/Caddyfile -o /etc/caddy
curl -s https://raw.githubusercontent.com/GEM7/My_scripts/master/caddy/caddy.service -o /usr/lib/systemd/system/caddy.service
```
