FROM debian:jessie
MAINTAINER Jordi Íñigo

ENV TERM linux
RUN apt-get -y update

# Download prerequisites
RUN apt-get -y install wget bzip2 make gdb libqt4-dev

# golang install
ENV VERSION 1.3
ENV OS linux
ENV ARCH amd64
RUN wget http://golang.org/dl/go$VERSION.$OS-$ARCH.tar.gz -q -O - | tar -zxf - -C /usr/local

# golang env
ENV GOPATH /go
ENV GOROOT /usr/local/go
ENV PATH $PATH:$GOPATH/bin

# LiteIDE
RUN wget http://sourceforge.net/projects/liteide/files/X22/liteidex22.linux-64.tar.bz2 -q -O - | bunzip2 -c | tar -xf - -C /usr/local
ADD linux64.env /usr/local/liteide/share/liteide/liteenv/linux64.env
ADD liteide.ini /.config/liteide/liteide.ini

# X11
# This is optional: RUN apt-get install -y xterm gnome-terminal
RUN apt-get install -y xterm

# shell launch
ENV QT_X11_NO_MITSHM 1
CMD ["/usr/local/liteide/bin/liteide"]
