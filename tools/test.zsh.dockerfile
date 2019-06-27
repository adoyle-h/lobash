FROM zshusers/zsh:5.3

WORKDIR /test

RUN printf '%s\n%s\n%s\n%s\n' \
    'deb http://mirrors.163.com/debian/ stretch main non-free contrib' \
    'deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib' \
    'deb http://mirrors.163.com/debian/ stretch-backports main non-free contrib' \
    'deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib' \
    > /etc/apt/sources.list

RUN apt-get update
RUN apt-get -y install git

RUN git clone --depth 1 https://github.com/bats-core/bats-core.git && \
    ./bats-core/install.sh /test/bats
RUN git clone --depth 1 https://github.com/jasonkarns/bats-assert-1.git
RUN git clone --depth 1 https://github.com/jasonkarns/bats-support.git

#---------------------------------------------

FROM zshusers/zsh:$VERSION

LABEL maintainer="ADoyle <adoyle.h@gmail.com>"
WORKDIR /lobash

RUN mkdir -p /test

COPY --from=0 /test/bats /test/bats
COPY --from=0 /test/bats-assert-1 /test/assert
COPY --from=0 /test/bats-support /test/support

ENV PATH=${PATH}:/test/bats/bin
