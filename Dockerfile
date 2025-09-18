FROM debian:trixie
LABEL org.opencontainers.image.authors="Dale C. Anderson"
LABEL org.opencontainers.image.url="https://github.com/dale-c-anderson/container-tools"
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -q update \
    && apt-get install --no-install-recommends -yq apt-utils \
    && apt-get install --no-install-recommends -yq apt-transport-https \
    && apt-get install --no-install-recommends -yq \
        curl \
        ca-certificates \
        wget \
        unzip \
        bzip2 \
        xz-utils \
        git \
        zip \
        jq \
        sshpass \
        openssh-client \
        rsync \
        default-mysql-client \
        sudo \
        procps \
        vim \
        pv \
        tree \
        net-tools \
        htop \
        make \
        less \
        bind9-dnsutils \
        netcat-openbsd \
        file \
        swaks \
        python3-pip \
        && rm -rf /var/lib/apt/lists/* \
        && rm -rf /var/cache/*
RUN echo "alias ll='ls -alF'" >> /root/.bashrc \
    && useradd -m appuser \
    && mkdir -p -v -m775 /home/appuser/.ssh \
    && chown -R appuser:appuser /home/appuser/.ssh \
    && echo "alias ll='ls -alF'" >> /etc/bash.bashrc \
    && echo "umask 002" >> /etc/bash.bashrc \
RUN echo "Container tools built on $(date --iso-8601=seconds)" > /image-build-date.txt \
CMD [ "cat", "/image-build-date.txt" ]
