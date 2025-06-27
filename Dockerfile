FROM python:3.12

WORKDIR /app

RUN git clone --depth 1 https://github.com/mikumifa/biliTickerBuy.git && \
cd biliTickerBuy && \
pip install -r requirements.txt --break-system-packages

WORKDIR /app/biliTickerBuy

ENTRYPOINT ["python3", "/app/biliTickerBuy/main.py"]