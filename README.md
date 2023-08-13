## Forked from https://github.com/SnoringDragon/gluetun-qbittorrent-port-manager ##

# gluetun-qbittorrent Port Manager with HTTPS capabilities
Automatically updates the listening port for qbittorrent to the port forwarded by [Gluetun](https://github.com/qdm12/gluetun/).

### Description
[Gluetun](https://github.com/qdm12/gluetun/) has the ability to forward ports for supported VPN providers, 
but qbittorrent does not have the ability to update its listening port dynamically.
Because of this, I wrote this short script available as a docker container which automatically detects changes to the 
forwarded_port file created by [Gluetun](https://github.com/qdm12/gluetun/) and updates the qbittorrent's listening port.

## Setup
First, ensure you are able to successfully connect qbittorrent to the forwarded port manually (can be seen by a green globe at the bottom of the WebUI).

Then add a mounted volume to [Gluetun](https://github.com/qdm12/gluetun/) (e.g. /yourfolder:/tmp/gluetun).

Next, add another mounted volume to add personal ca.crt if using self-signed certs and you want the green checkmark!

Finally, use the docker-compoase.yml template to add it into your existing compose file that includes gluetun
