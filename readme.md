docker-golang-devel
===================

Go language development container (golang) that includes LiteIDE.

Versions:

- Go 1.3
- LiteIDE x22

Run
---

You need to run it locally (DOCKER_HOST must be in your host) in a system with XWindows (XWindows Server).

    docker run -e "DISPLAY=$DISPLAY" -v="/tmp/.X11-unix:/tmp/.X11-unix:rw" -v "/usr -ti jordi/golang

Pull
----


Build
-----
