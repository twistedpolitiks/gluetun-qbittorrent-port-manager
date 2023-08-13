# gluetun-qbittorrent Port Manager
Automatically updates the listening port for qbittorrent to the port forwarded by [Gluetun](https://github.com/qdm12/gluetun/).

### Description
[Gluetun](https://github.com/qdm12/gluetun/) has the ability to forward ports for supported VPN providers, 
but qbittorrent does not have the ability to update its listening port dynamically.
Because of this, I wrote this short script available as a docker container which automatically detects changes to the 
forwarded_port file created by [Gluetun](https://github.com/qdm12/gluetun/) and updates the qbittorrent's listening port.

## Setup
First, ensure you are able to successfully connect qbittorrent to the forwarded port manually (can be seen by a green globe at the bottom of the WebUI).

Then add a mounted volume to [Gluetun](https://github.com/qdm12/gluetun/) (e.g. /yourfolder:/tmp/gluetun).

Finally, add the following snippet to your `docker-compose.yml`, substituting the default values for your own.

```yml
...

  gluetun-qbittorrent-port-manager:
    image: snoringdragon/gluetun-qbittorrent-port-manager:latest
    restart: unless-stopped
    volumes:
      - /yourfolder:/tmp/gluetun #Set "yourfolder" to the same directory you used for Gluetun
      - /locationofca.crt:/usr/local/share/ca-certificates
    network_mode: "service: gluetun"
    environment:
      QBITTORRENT_SERVER: localhost
      QBITTORRENT_HOSTNAME: localhost
      QBITTORRENT_PORT: 8080
      QBITTORRENT_USER: admin
      QBITTORRENT_PASS: adminadmin
      PORT_FORWARDED: /tmp/gluetun/forwarded_port
      HTTP_HTTPS: http(s)

...
```
