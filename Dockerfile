FROM golang:1.17-bullseye AS builder

RUN apt -y install git
RUN echo 'deb [trusted=yes] https://repo.goreleaser.com/apt/ /' | tee /etc/apt/sources.list.d/goreleaser.list
RUN apt update
RUN apt -y install goreleaser
RUN goreleaser release --snapshot --rm-dist

RUN mkdir /src

COPY . /SRC
