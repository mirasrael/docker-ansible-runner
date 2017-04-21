FROM williamyeh/ansible:alpine3

RUN apk add --no-cache git openssh-client bash rsync docker postgresql-dev curl
RUN mkdir /workdir
RUN mkdir -p /root/.ssh
RUN mkdir /c /d /e /f /g /h /k /l /m /n /o /p /r /s /t /u /v /w /x /y /z
# Fix for 2.1.0 ansible
RUN sed --in-place=.bak -e 's/validate_certs=/verify=/' /usr/lib/python2.7/site-packages/ansible/modules/extras/clustering/consul.py
ADD https://releases.hashicorp.com/terraform/0.9.3/terraform_0.9.3_linux_amd64.zip /stage/
RUN cd stage && unzip terraform_0.9.3_linux_amd64.zip && cp terraform /usr/bin/terraform
RUN chmod +x /usr/bin/terraform
RUN rm -rf /stage

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
