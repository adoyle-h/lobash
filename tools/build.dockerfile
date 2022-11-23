ARG VERSION
FROM bash:$VERSION

LABEL maintainer="ADoyle <adoyle.h@gmail.com>"
LABEL description="For building lobash"

ARG APK_PROXY

RUN if [ -n "$APK_PROXY" ]; then \
  cp /etc/apk/repositories /etc/apk/repositories.bak && \
  sed -i "s|dl-cdn.alpinelinux.org|$APK_PROXY|g" /etc/apk/repositories ; \
  fi

RUN apk update && apk add --no-cache git

RUN if [ -n "$APK_PROXY" ]; then mv -f /etc/apk/repositories.bak /etc/apk/repositories ; fi

ENTRYPOINT [ "bash", "-c" ]
CMD [ "bash" ]
