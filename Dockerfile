FROM golang:alpine

RUN echo "@edge http://dl-4.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories \
    && apk add --no-cache openssh git autossh@edge \
    && go get -u github.com/moul/advanced-ssh-config/cmd/assh \
    && addgroup ssh \
    && adduser -h /config -s /bin/ash -G ssh -D ssh \
    && mkdir -p /config/.ssh && chown -R ssh:ssh /config/.ssh

USER ssh

WORKDIR /config

VOLUME ["/config/.ssh"]

ENTRYPOINT ["/usr/bin/ssh"]

CMD ["-V"]
