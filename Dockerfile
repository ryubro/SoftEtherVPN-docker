FROM debian:jessie

RUN apt update && apt install -y \
    wget \
    unzip \
    build-essential \
    libreadline-dev \
    libssl-dev \
    libncurses5-dev \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/archive/refs/tags/v4.38-9760-rtm.zip \
    && unzip /v4.38-9760-rtm.zip \
    && rm /v4.38-9760-rtm.zip

WORKDIR /SoftEtherVPN_Stable-4.38-9760-rtm

RUN ./configure \
    && make build \
    && make build install

WORKDIR /

RUN rm -r /SoftEtherVPN_Stable-4.38-9760-rtm

EXPOSE 500/udp 4500/udp 1701/udp 5555/tcp 443/tcp

COPY vpnserver-start.sh /
RUN chmod u+x /vpnserver-start.sh

CMD ["/vpnserver-start.sh"]
