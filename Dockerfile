FROM jordi/ubuntu

RUN apt-get -y update
RUN apt-get -y install wget
RUN apt-get -y install byobu
ENV VERSION 1.2.2
ENV OS linux
ENV ARCH amd64
RUN wget http://golang.org/dl/go$VERSION.$OS-$ARCH.tar.gz
RUN tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
ENV PATH $PATH:/usr/local/go/bin
ADD hello.go hello.go
RUN go run hello.go
