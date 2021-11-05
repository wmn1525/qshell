# Docker Image for [Qiniu CLI Tool](https://github.com/qiniu/qshell) (QShell)

This repo contains a Dockerfile that for the Qiniu CLI tool, a.k.a. qshell.2.64

For Linux x64, you can directly using the image built by Docker Hub CI:

```bash
docker run --rm -it wmn1525/qshell
```

On the other systems or architectures, it's recommended to build it yourself. Build an image for arm for example:

```bash
docker build -t qshell:arm --build-arg OS=linux --build-arg ARCH=arm .
```

## TODOs

- Build images using source codes instead of downloading the artifact.
