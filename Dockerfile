FROM centos:8 as base

LABEL maintainer="kubajasko@hotmail.co.uk"
LABEL technitium-website="https://technitium.com/dns/"

# 53: DNS Service, 5380: Web Console Access, 67: Built-in DHCP server
EXPOSE 53/udp
EXPOSE 53/tcp
EXPOSE 5380/tcp
EXPOSE 67/udp

RUN yum install -y dotnet
RUN sed -i '1 i\nameserver 127.0.0.1' /etc/resolv.conf

WORKDIR /etc/dns/
RUN curl https://download.technitium.com/dns/DnsServerPortable.tar.gz \
  | tar xz 

VOLUME /etc/dns/config

ENTRYPOINT /etc/dns/start.sh
