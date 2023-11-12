FROM python:3.12.0-bookworm

COPY ./requirements.txt /opt/requirements.txt

RUN apt-get update -y && \
    apt-get install build-essential -y && \
    pip3 install -r /opt/requirements.txt