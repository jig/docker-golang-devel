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
RUN wget http://golang.org/dl/go$VERSION.$OS-$ARCH.tar.gz
RUN tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
ENV PATH $PATH:/usr/local/go/bin

# golang test
ADD hello.go hello.go
RUN go run hello.go

# shell launch
CMD ["/usr/bin/byobu"]
