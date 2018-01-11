FROM python:3.6.4-alpine3.7

# chromiumインストール
RUN apk update \
 && apk add --update --no-cache chromium chromium-chromedriver curl openssl

# 日本語フォントインストール
RUN mkdir /tmp/noto \
 && cd /tmp/noto \
 && wget https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip \
 && unzip NotoSansCJKjp-hinted.zip \
 && mkdir -p /usr/share/fonts/noto \
 && cp *.otf /usr/share/fonts/noto \
 && chmod 644 -R /usr/share/fonts/noto/ \
 && fc-cache -fv \
 && cd / \
 && rm -rf /tmp/noto

# python libraryインストール
RUN pip install --no-cache-dir --upgrade pip
RUN apk add --update --no-cache \
      build-base \
      libxml2-dev \
      libxslt-dev \
      libffi-dev \
      openssl-dev
RUN pip install --no-cache-dir selenium scrapy pytz

# 作業ディレクトリ設定
RUN mkdir -p /chromium
WORKDIR /chromium

ENTRYPOINT tail -f /dev/null
