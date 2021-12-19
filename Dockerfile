FROM golang:1.17-bullseye AS builder

RUN echo 'deb [trusted=yes] https://repo.goreleaser.com/apt/ /' | tee /etc/apt/sources.list.d/goreleaser.list
RUN apt-get update
RUN apt-get -y install git awscli goreleaser

ARG GITHUB_TOKEN
ENV GITHUB_TOKEN ${GITHUB_TOKEN}

RUN mkdir /src
COPY . /src
WORKDIR /src

RUN echo $GITHUB_TOKEN

RUN git remote rm origin
RUN git remote add origin git@github.com:TaylorMonacelli/nanofibrous_budded
RUN git config --global user.email "taylormonacelli@gmail.com"
RUN git config --global user.name "Taylor Monacelli"

RUN goreleaser release --snapshot --rm-dist
RUN goreleaser check
RUN git tag -a v0.1.0 -m "First release"
RUN git push origin v0.1.0
RUN goreleaser release
