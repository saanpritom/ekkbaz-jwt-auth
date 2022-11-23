FROM python:3.10.8-alpine

ARG BUILD_TYPE=development

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main openssl \
    build-base cmake musl-dev linux-headers alpine-sdk postgresql-client libpq nginx

RUN apk add --no-cache --upgrade --virtual .build-deps postgresql-dev zlib-dev jpeg-dev libcurl \
    libressl-dev curl-dev

WORKDIR /service
COPY . .
COPY nginx/default.conf /etc/nginx/http.d/default.conf

RUN apk add --no-cache libffi-dev
RUN pip install --upgrade pip && \
    pip install -r requirements.txt  --no-cache-dir

RUN chmod a+x setup.sh
ENTRYPOINT ["./setup.sh"]
