FROM python:3.12

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl tzdata xvfb x11vnc supervisor xauth \
    fluxbox xterm fonts-wqy-zenhei fonts-wqy-microhei \
    fontconfig && \
    ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    fc-cache -fv && \
git clone --depth 1 https://github.com/mikumifa/biliTickerBuy.git && \
cd biliTickerBuy && \
pip install -r requirements.txt --break-system-packages && \
apt-get clean && \
    rm -rf \
    /tmp/* \
    /usr/share/doc/* \
    /var/cache/* \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /var/log/* && \

ENV TZ=Asia/Shanghai

WORKDIR /app/biliTickerBuy

ENTRYPOINT ["python3", "/app/biliTickerBuy/main.py"]