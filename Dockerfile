FROM williamyeh/ansible:alpine3

RUN apk add --no-cache git openssh-client bash rsync
RUN mkdir /workdir
RUN mkdir -p /root/.ssh
RUN mkdir /c /d /e /f /g /h /k /l /m /n /o /p /r /s /t /u /v /w /x /y /z

COPY ansible-runner.sh /root/ansible-runner.sh
RUN chmod +x /root/ansible-runner.sh

VOLUME /workdir
VOLUME /ssh
VOLUME ["/c", "/d", "/e", "/f", "/g", "/h", "/k", "/l", "/m", "/n", "/o", "/p", "/r", "/s", "/t", "/u", "/v", "/w", "/x", "/y", "/z"]

ENV USER root
ENV HOME /root

WORKDIR /workdir

ENTRYPOINT ["/root/ansible-runner.sh"]

CMD ["/bin/sh"]
