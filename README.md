docker-golang-devel
===================

Go language development container (golang) that includes Go compiler and tools and LiteIDE.

Software versions:

- Go 1.5
- LiteIDE x27.2.1

Run
---

The container must reside in your workstation (so docker client and server are on the same host).

You need to run it in a system with XWindows (XWindows Server), where your LiteIDE windows will appear. 

Several variables and temporal files must be set up in order to the container to "see" your display. For convenience a script does all that for you, and calls `docker run ... jordi/golang`. Just:

```
$ ./dliteide
```

or better install this script on your PATH.

If you edit and save your source files, they will remain on your host after the container has been stopped or killed.

Pull
----

	$ docker pull jordi/golang

Build
-----

`git clone` this project, cd into it, and:

	$ docker build -t golang .

