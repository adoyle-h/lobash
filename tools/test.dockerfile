FROM bash:$VERSION

WORKDIR /test

RUN \
    cp /etc/apk/repositories /etc/apk/repositories.bak && \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk update

RUN apk add git
RUN git clone --depth 1 https://github.com/bats-core/bats-core.git && \
    ./bats-core/install.sh /test/bats
RUN git clone --depth 1 https://github.com/jasonkarns/bats-assert-1.git
RUN git clone --depth 1 https://github.com/jasonkarns/bats-support.git

FROM bash:$VERSION

LABEL maintainer="ADoyle <adoyle.h@gmail.com>"
WORKDIR /lobash

RUN mkdir -p /test
COPY --from=0 /test/bats /test/bats
COPY --from=0 /test/bats-assert-1 /test/assert
COPY --from=0 /test/bats-support /test/support
ENV PATH=${PATH}:/test/bats/bin
