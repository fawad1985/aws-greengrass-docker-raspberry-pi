FROM resin/rpi-raspbian

RUN adduser --system ggc_user \
    && groupadd --system ggc_group

RUN apt-get update \
    && apt-get install -y sqlite3 \
    && echo 'fs.protected_symlinks = 1' >> /etc/sysctl.d/98-rpi.conf \
    && echo 'fs.protected_hardlinks = 1' >> /etc/sysctl.d/98-rpi.conf

ADD downloads/greengrass.tar.gz /

EXPOSE 8883

COPY start.sh /

# CMD "/bin/bash"
# CMD /greengrass/ggc/core/greengrassd start
ENTRYPOINT ["/start.sh"]
