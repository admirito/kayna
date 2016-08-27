FROM ubuntu
MAINTAINER Mohammad Razavi <mrazavi64@gmail.com>

COPY kayna /usr/local/bin/
COPY id_rsa id_rsa.pub /root/.ssh/
COPY dput.cf /root/dput.cf
COPY known-dists /usr/share/lintian/vendors/kayna/main/data/changes-file/known-dists
COPY main.profile /usr/share/lintian/profiles/kayna/main.profile

RUN chmod 600 /root/.ssh/id_rsa && \
    mkdir -p /etc/update-motd.d/ && \
    echo "#!/bin/sh" >> /etc/update-motd.d/99-kayna-footer && \
    echo "echo Kayna Docker Image" >> /etc/update-motd.d/99-kayna-footer && \
    echo "echo Originally Made by Mohammad Razavi" >> /etc/update-motd.d/99-kayna-footer && \
    echo "echo *mrazavi64 at gmail dot com*" >> /etc/update-motd.d/99-kayna-footer && \
    echo "echo" >> /etc/update-motd.d/99-kayna-footer && \
    chmod +x /etc/update-motd.d/99-kayna-footer && \
    echo "/etc/update-motd.d/99-kayna-footer" >> /root/.bashrc && \
    sed -i 's|/archive.ubuntu.com|/catan.archive.ubuntu.com|' /etc/apt/sources.list && \
    sed -i 's|^\s*deb-src|# deb-src|' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --force-yes devscripts equivs git curl zile && \
    ln -s /usr/bin/zile /usr/bin/emacs || true && \
    curl http://eldorado/pepero.gpg.key | apt-key add - && \
    printf "deb http://eldorado/ xenial-testing main\n" > /etc/apt/sources.list.d/eldorado.list && \
    apt-get update && \
    (echo; cat /root/dput.cf) >> /etc/dput.cf && \
    rm /root/dput.cf && \
    printf "Host eldorado\nStrictHostKeyChecking no\n" > /root/.ssh/config
