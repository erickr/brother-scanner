FROM debian:buster


RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y wget sane libsane procps graphicsmagick-imagemagick-compat && \
    wget https://download.brother.com/welcome/dlf006645/brscan4-0.4.9-1.amd64.deb && \
    wget https://download.brother.com/welcome/dlf006652/brscan-skey-0.3.1-2.amd64.deb && \
    DEBIAN_FRONTEND=noninteractive apt install -y ./brscan-skey-0.3.1-2.amd64.deb && \
    DEBIAN_FRONTEND=noninteractive apt install -y ./brscan4-0.4.9-1.amd64.deb

COPY start.sh /
COPY scan.sh /

CMD /start.sh
#CMD /src/start.sh