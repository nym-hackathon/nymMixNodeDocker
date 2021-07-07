FROM ubuntu:20.04
LABEL version="0.1"
LABEL description="This is custom Docker Image for \
the NYM mixnode, validator and gateway."
ARG DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
WORKDIR /root
USER root
RUN useradd -m nym --uid=1000 && echo "nym:docker" | \
    chpasswd
RUN usermod -G sudo nym
COPY ossetup.sh .
RUN ./ossetup.sh
WORKDIR /home/nym
USER nym
COPY nym-mixnode /home/nym/
COPY nymsetup.sh .
RUN ./nymsetup.sh
ENTRYPOINT ["/home/nym/nym-mixnode"]
EXPOSE 8000 1789 1790
#EXPOSE 1317 26656 26660 80 443 8000 1790
