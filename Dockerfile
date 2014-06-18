FROM jordi/docker-devel
MAINTAINER Jordi Inyigo

RUN apt-get -y update

# golang install
ENV VERSION 1.2.2
ENV OS linux
ENV ARCH amd64
RUN wget -q http://golang.org/dl/go$VERSION.$OS-$ARCH.tar.gz
RUN tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
ENV PATH $PATH:/usr/local/go/bin

# curses debugger cgdb
RUN apt-get -y install cgdb

# golang env
ENV GOPATH /root/go
ENV PATH $PATH:$GOPATH/bin
WORKDIR /root/go/src

# shell launch
CMD ["/usr/bin/byobu"]
