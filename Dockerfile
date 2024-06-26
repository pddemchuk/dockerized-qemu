FROM alpine:3.19

ARG RAM=2048 \
    HOSTNAME=polina

RUN apk update && \
    apk add \ 
	qemu-system-x86_64 \
	openssh && \
    rm -rf /etc/apk/cache

RUN echo "\
    PORT=10022 \
    qemu-system-x86_64 -enable-kvm -cpu host \
            -net user,hostfwd=tcp::'${PORT:?}'-:22 -net nic \
            -nographic -monitor none -serial none \
            -m ${RAM:?} image.img & \
    echo 'VM is booting...' \
    until ssh '${HOSTNAME:?}'@localhost -p ${PORT:?} 2> /dev/null \
    do \
        sleep 1 \
    done \
    " > /qemu/run.sh && \
    chmod +x /qemu/run.sh

ENTRYPOINT ["/bin/bash", "/qemu/run.sh"]
