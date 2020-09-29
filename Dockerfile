FROM python:3.8-slim

LABEL maintainer="Jakub Turek <jkbturek@gmail.com>"
LABEL "com.github.actions.name"="danger-python"
LABEL "com.github.actions.description"="Runs Python Dangerfiles"
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="blue"

# Install dependencies
RUN apt-get update -y --fix-missing && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

RUN python -m pip install --upgrade pip
RUN pip install poetry

RUN mkdir -p /usr/src/danger-python
COPY . /usr/src/danger-python
RUN cd /usr/src/danger-python && \
    poetry config virtualenvs.create false && \
    poetry install --no-dev
