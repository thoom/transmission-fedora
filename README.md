transmission-fedora
===================

Transmission Daemon Docker Container based in Fedora

Application container, don't forget to specify a password for `transmission` account and local directory for the downloads:

```
    docker run -d --name transmission \
    -p 12345:12345 -p 12345:12345/udp -p 127.0.0.1:9091:9091 \
    -e ADMIN_PASS=password \
    -v /local/dir/downloads:/var/lib/transmission/downloads \
    -v /local/dir/incomplete:/var/lib/transmission/incomplete \
    -v /local/dir/watch:/var/lib/transmission/watch \
    eminguez/transmission-fedora
```

All credits to @elventear and his repo https://github.com/elventear/docker-transmission (I've just adapt it to Fedora)