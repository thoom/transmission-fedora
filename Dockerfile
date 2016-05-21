FROM fedora:latest

MAINTAINER Eduardo Minguez <edu@linux.com>

RUN dnf clean all && \
    dnf update -y && \
    dnf install -y transmission-daemon && \
    dnf clean all

ADD files/transmission-daemon /etc/transmission-daemon
ADD files/run_transmission.sh /run_transmission.sh
ADD files/transmission-umask.sh /etc/profile.d/transmission-umask.sh

RUN useradd -u 1000 -g 1000 transmission

RUN mkdir -p /var/lib/transmission/{incomplete,downloads,watch} && \
    chown -R transmission:transmission /var/lib/transmission && \
    chown -R transmission:transmission /etc/transmission-daemon    

VOLUME ["/var/lib/transmission/downloads", "/var/lib/transmission/incomplete", "/var/lib/transmission/watch"]

EXPOSE 9091 12345

USER transmission

CMD ["/run_transmission.sh"]
