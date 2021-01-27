FROM ubuntu
MAINTAINER Mohammad Razavi <mrazavi64@gmail.com>

COPY kayna /usr/local/bin/
COPY id_rsa id_rsa.pub /root/.ssh/
COPY dput.cf /root/dput.cf
COPY known-dists /usr/share/lintian/vendors/kayna/main/data/changes-file/known-dists
COPY main.profile /usr/share/lintian/profiles/kayna/main.profile
COPY kayna.conf /etc/kayna/kayna.conf
COPY docker-extra-bin/* /usr/local/bin/

RUN chmod 600 /root/.ssh/id_rsa && \
    mkdir -p /etc/update-motd.d/ && \
    echo "#!/bin/sh" >> /etc/update-motd.d/99-kayna-footer && \
    echo "echo Kayna Docker Image" >> /etc/update-motd.d/99-kayna-footer && \
    echo "echo Originally Made by Mohammad Razavi" >> /etc/update-motd.d/99-kayna-footer && \
    echo "echo *mrazavi64 at gmail dot com*" >> /etc/update-motd.d/99-kayna-footer && \
    echo "echo" >> /etc/update-motd.d/99-kayna-footer && \
    chmod +x /etc/update-motd.d/99-kayna-footer && \
    echo "/etc/update-motd.d/99-kayna-footer" >> /root/.bashrc && \
    sed -i -e '/[a-z]\+-security/d' -e '/[a-z]\+-backports/d' /etc/apt/sources.list && \
    sed -i 's|/archive.ubuntu.com|/catan.archive.ubuntu.com|' /etc/apt/sources.list && \
    sed -i 's|^\s*deb-src|# deb-src|' /etc/apt/sources.list && \
    apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y --force-yes devscripts equivs git curl wget rsync zile ccache docker.io pristine-tar quilt && \
    ln -s /usr/bin/zile /usr/bin/emacs || true && \
    curl http://eldorado/pepero.gpg.key | apt-key add - && \
    #printf "deb http://eldorado/ xenial-testing main\n" > /etc/apt/sources.list.d/eldorado.list && \
    apt update && \
    (echo; cat /root/dput.cf) >> /etc/dput.cf && \
    rm /root/dput.cf && \
    printf "Host eldorado\nStrictHostKeyChecking no\n" > /root/.ssh/config
