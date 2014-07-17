FROM debian:jessie
MAINTAINER Jordi Íñigo

ENV TERM linux
RUN apt-get -y update

# Download prerequisites
RUN apt-get -y install wget bzip2

# golang install
ENV VERSION 1.3
ENV OS linux
ENV ARCH amd64
RUN wget http://golang.org/dl/go$VERSION.$OS-$ARCH.tar.gz -q -O - | tar -zxf - -C /usr/local

# golang env
ENV GOPATH /usr/local/go
ENV PATH $PATH:$GOPATH/bin

#Qt
RUN apt-get install -y qt4-qmake libqt4-dev

# LiteIDE
RUN wget http://sourceforge.net/projects/liteide/files/X22/liteidex22.linux-64.tar.bz2 -q -O - | bunzip2 -c | tar -xf - -C /usr/local

# X11
# RUN apt-get install -y x11-common x11-utils libx11-6 libglib2.0-0
VOLUME /tmp/.X11-unix

# shell launch
ENV QT_X11_NO_MITSHM 1
CMD ["/usr/local/liteide/bin/liteide"]
