docker-golang-devel
===================

Go language development container (golang) that includes Go and LiteIDE.

Softare versions:

- Go 1.3
- LiteIDE x22

Run
---

This is works when the container resides in your same workstation (docker client and server are on the same system).

You need to run it in a system with XWindows (XWindows Server). To run it, first allow root user to access your display with:

    xhost + SI:localuser:root

you need to do this because now root, that runs docker daemon, must be able to access your XWindows session. 

Now you can launch the Go IDE, LiteIDE. You must share your DISPLAY environment variable (usually ":0", "unix:0.0", etc.), and share the X11 unix socket, and your source directory. You do that with this single line (first change /<user-home-dir>/go with the absolute path of your src parent directory. This is the value of GOPATH env var if you had installed Go in your workstation (host)):

    docker run -e "DISPLAY=$DISPLAY" -v="/tmp/.X11-unix:/tmp/.X11-unix:rw" -v "/<user-home-dir>/go:/go:rw" -ti jordi/golang

If you edit and save your source files, they will remain on your host after the container has been stopped or killed.

Pull
----

    docker pull jordi/golang

Build
-----

git clone this project, cd into it, and:

    docker build -t golang .
