FROM jordi/golang-run
MAINTAINER Jordi Íñigo

# Download LiteIDE prerequisites
RUN apt-get -y install make gdb libqt4-dev

# LiteIDE
RUN wget http://sourceforge.net/projects/liteide/files/X23.2/liteidex23.2.linux-64.tar.bz2 -q -O - | bunzip2 -c | tar -xf - -C /usr/local
ADD linux64.env /usr/local/liteide/share/liteide/liteenv/linux64.env
ADD liteide.ini /.config/liteide/liteide.ini

# X11
# This is optional: RUN apt-get install -y xterm gnome-terminal
RUN apt-get install -y xterm

# shell launch
ENV QT_X11_NO_MITSHM 1
CMD ["/usr/local/liteide/bin/liteide"]
