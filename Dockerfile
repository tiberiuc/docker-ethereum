FROM tiberiuc/backup_agent as backup
MAINTAINER Tiberiu Craciun <tibi@happysoft.ro>


FROM ethereum/client-go:alpine
RUN apk update \
  && apk --no-cache add tar bash supervisor bzip2 inotify-tools \
  && apk del wget \
  && rm -rf /var/cache/apk/* /tmp/*

COPY --from=backup /usr/local/bin/backup_agent /usr/local/bin/backup_agent

EXPOSE 8545 8546 30303 30303/udp 9191

ADD ./scripts/backup.sh /usr/local/bin/backup.sh
ADD ./scripts/restore_backup.sh /usr/local/bin/restore_backup.sh
ADD ./scripts/ethereum_entrypoint.sh /usr/local/bin/ethereum_entrypoint.sh
RUN chmod a+x /usr/local/bin/ethereum_entrypoint.sh \
    && chmod a+x /usr/local/bin/backup.sh \
    && chmod a+x /usr/local/bin/restore_backup.sh

ENTRYPOINT ["/usr/local/bin/ethereum_entrypoint.sh"]
