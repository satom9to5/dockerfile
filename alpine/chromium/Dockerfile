FROM alpine:edge

# chromiumインストール
RUN apk add --update chromium

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

# 作業ディレクトリ設定
RUN mkdir -p /chromium
WORKDIR /chromium

ENTRYPOINT tail -f /dev/null
