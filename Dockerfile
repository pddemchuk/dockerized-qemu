FROM alpine:3.19

WORKDIR /qemu

RUN apk update && \
    apk add \ 
	qemu-system-x86_64 \
	openssh && \
    rm -rf /etc/apk/cache

COPY run.sh .

ENV RAM=2048

ENTRYPOINT ["sh", "run.sh"]
