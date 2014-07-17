docker-golang-devel
===================

Go language development container (golang) that includes Go compiler and tools and LiteIDE.

Softare versions:

- Go 1.3
- LiteIDE x22

Run
---

The container must reside in your workstation (so docker client and server are on the same host).

You need to run it in a system with XWindows (XWindows Server). 

First allow root to access your display with:

	$ xhost + SI:localuser:root

you need to do this because root runs docker daemon, and docker (this container) must be able to access your XWindows session. 

Now you can launch the Go IDE, LiteIDE. You must share your DISPLAY environment variable (usually `:0`, `unix:0.0`, etc.), and share the X11 unix socket, and your source directory. You must allow `--privileged` in order to let `gdb` debug. You do that with the single line below (change `/<user-home-dir>/go` with the absolute path of your src parent directory. This is the value of `GOPATH` env var if you had installed Go in your workstation (host)):

	$ docker run --privileged -e "DISPLAY=$DISPLAY" -v="/tmp/.X11-unix:/tmp/.X11-unix:rw" -v="/<user-home-dir>/go:/go:rw" jordi/golang

If you edit and save your source files, they will remain on your host after the container has been stopped or killed.

Pull
----

	$ docker pull jordi/golang

Build
-----

`git clone` this project, cd into it, and:

	$ docker build -t golang .

