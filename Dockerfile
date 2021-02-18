FROM alpine:latest

RUN apk add --no-cache openssh git autossh sshpass \
    && addgroup ssh \
    && adduser -h /config -s /bin/ash -G ssh -D ssh \
    && mkdir -p /config/.ssh && chown -R ssh:ssh /config/.ssh

USER ssh

WORKDIR /config

VOLUME ["/config/.ssh"]

ENTRYPOINT ["/usr/bin/ssh"]

CMD ["-V"]
