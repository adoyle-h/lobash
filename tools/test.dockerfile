ARG VERSION
FROM bash:$VERSION

WORKDIR /test

ARG APK_PROXY
ARG GH_PROXY

RUN if [ -n "$APK_PROXY" ]; then \
  cp /etc/apk/repositories /etc/apk/repositories.bak && \
  sed -i "s|dl-cdn.alpinelinux.org|$APK_PROXY|g" /etc/apk/repositories ; \
  fi

RUN apk update && apk add git
RUN git clone --depth 1 --branch v1.1.0 ${GH_PROXY}https://github.com/bats-core/bats-core.git && \
  ./bats-core/install.sh /test/bats
RUN git clone --depth 1 ${GH_PROXY}https://github.com/jasonkarns/bats-assert-1.git
RUN git clone --depth 1 ${GH_PROXY}https://github.com/jasonkarns/bats-support.git

#---------------------------------------------

FROM bash:$VERSION

LABEL maintainer="ADoyle <adoyle.h@gmail.com>"
WORKDIR /lobash

ARG APK_PROXY

RUN if [ -n "$APK_PROXY" ]; then \
  cp /etc/apk/repositories /etc/apk/repositories.bak && \
  sed -i "s|dl-cdn.alpinelinux.org|$APK_PROXY|g" /etc/apk/repositories ; \
  fi

RUN apk update && apk add --no-cache git perl && mkdir -p /test

COPY --from=0 /test/bats /test/bats
COPY --from=0 /test/bats-assert-1 /test/assert
COPY --from=0 /test/bats-support /test/support

ENV PATH=${PATH}:/test/bats/bin

ENTRYPOINT [ "bash", "-c" ]
CMD [ "bash" ]
