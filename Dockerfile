FROM jordi/ubuntu
MAINTAINER Jordi Inyigo

RUN apt-get -y update
RUN apt-get -y install wget
RUN apt-get -y install byobu
ADD tmux.conf /.byobu/.tmux.conf
ADD keybindings.tmux /.byobu/keybindings.tmux

# golang install
ENV VERSION 1.2.2
ENV OS linux
ENV ARCH amd64
RUN wget -q http://golang.org/dl/go$VERSION.$OS-$ARCH.tar.gz
RUN tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
ENV PATH $PATH:/usr/local/go/bin

# git and development tols
RUN apt-get -y install git
RUN apt-get -y install vim
RUN apt-get -y install cgdb

# golang env
ENV GOPATH /root/go
ENV PATH $PATH:$GOPATH/bin
WORKDIR /root/go/src

# shell launch
CMD ["/usr/bin/byobu"]
