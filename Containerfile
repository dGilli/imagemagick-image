FROM alpine:3.19
LABEL maintainer="me@dennisgilli.com"

RUN apk add --no-cache \
    imagemagick=7.1.1.32-r0 \
    libjpeg-turbo=3.0.1-r0 \
    libpng=1.6.44-r0 \
    libwebp=1.3.2-r0 \
    libheif=1.17.6-r0

WORKDIR /workspace

CMD ["magick", "--version"]
