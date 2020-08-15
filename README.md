# Technitium DNS

Host your own DNS server using docker!
Running the open-source Technitum DNS server (https://technitium.com/dns/)

It has a website at port 5380, the DNS server runs on port 53 and there is an internal DHCP server of port 67.

## Running

To spin it up to play with:

`docker run --rm -it -p 5380:5380 -p 53:53 bauk/technitium-dns`

To save the config you need to mount the docker volume. e.g.:

`docker run --rm -it -p 5380:5380 -p 53:53 -v $PWD/dns-config:/etc/dns/config bauk/technitium-dns`

### Compose example:

```yaml
version: "3.4"

services:
  dns-server:
    image: bauk/technitium-dns:latest
    volumes:
      - /docker/mount/path/dns-config:/etc/dns/config
    ports:
      - 5380:5380/tcp
      - 53:53/tcp
      - 53:53/udp
```

## Usage

You can go to the website at port 5380 to configure the DNS entries.
To test them you can exec into the container which is automatically setup to point to the DNS server it hosts.

To add another linux box to to use this DNS server simply edit the /etc/resolv.conf file to add another nameserver pointint to the IP exposed by this container.
