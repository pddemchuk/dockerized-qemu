FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install qemu-system -y && \
    rm -rf /var/cache/apt

#tmp
RUN apt-get install -y vim openssh-server

WORKDIR /run

COPY run.sh .

ENV RAM=2048

ENTRYPOINT ["bash", "run.sh"]
