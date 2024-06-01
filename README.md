# Eyes

*Wherever your eyes look, your future will follow.*

Docker image with a GUI application to test a container's GUI access.

## How to use

Download the project to build your local image, or just execute the *docker run* step to download it from the Docker Hub repository.

## Prerequisites

It is necessary to have installed:

- docker 26.1.+
- make 4.3.+

To install the make just run

```bash
dnf install -y bash-completion make
```
or
```bash
apt update;  apt install -y bash-completion make
echo "if [ -f /etc/bash_completion ]; then . /etc/bash_completion; fi" >> ~/.bashrc
source ~/.bashrc
```

To install the docker:

<https://docs.docker.com/get-docker/>


### Build
Required: [Setup](#prerequisites)

Execute the command:

```bash
make build
```

Or the command for the latest:

```bash
make build LATEST=true
```

### Run
Required: [Build](#build)

Execute the command:

```bash
make run
```

### Push
Required: [Build](#build)

Execute the command:

```bash
make push
```

Or the command for the latest:

```bash
make push LATEST=true
```
