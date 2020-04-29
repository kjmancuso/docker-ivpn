FROM ubuntu:latest

ARG DEBIAN_FRONTEND="noninteractive"

RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections

RUN apt-get update && \
    apt-get install -y ca-certificates \
                       curl \
                       iptables \
                       iproute2 \
                       iputils-ping \
                       resolvconf \
                       wireguard

RUN echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf

VOLUME /config

