+++
title = "Download Kosmorro"
description = "All the instructions to install Kosmorro, depending on your platform!"
template = "base.html"
+++

# Download Kosmorro

Kosmorro is currently available on the platforms listed bellow.

- [Linux](#linux)
- [FreeBSD](#freebsd)
- [macOS](#macos)
- [Docker image](#docker-image)
- [Compile from sources](#compile-from-sources)

## Linux

### Arch Linux

Kosmorro is available [on the AUR](https://aur.archlinux.org)! To install it, use your favorite AUR helper:

```bash
yay kosmorro
```

### Other Linux distributions

First, install Python 3 and its PIP3 package manager. Then, use PIP3 to install Kosmorro. For instance, on Debian, invoke the following commands:

```bash
apt install python3 python3-pip
pip3 install kosmorro
```

## FreeBSD

Kosmorro is available in [your official repositoried](https://www.freshports.org/astro/kosmorro)! You can install it directly with your package manager:

```bash
pkg install kosmorro
```

## macOS

macOS currently does not include Python 3 (only Python 2 is provided). The best and simpler method to install it is with [HomeBrew](https://brew/sh). Follow the installation instructions to get it, then install the `python` package from it. Once it is done, use PIP3 to install Kosmorro:

```bash
brew install python
pip3 install kosmorro
```

## Docker image

Kosmorro is available on Docker Hub! You can get it by running:

```bash
docker pull kosmorro/kosmorro
```

Note that for more convenience, you might want to add the following in your shell configuration:

```bash
alias kosmorro="docker run kosmorro/kosmorro kosmorro"
```

This way, you will be able to run Kosmorro with the `kosmorro` command, as you would if it had been installed on your system.

### About the image tags

Running `docker pull kosmorro/kosmorro` will download the latest tag by default, which corresponds to the last version of Kosmorro. If you prefer, you can also force pulling a specific version by specifying it after the `:` character:

```bash
docker pull kosmorro/kosmorro:${version}
```

Five kinds of tags are available:

<div style="overflow-x: auto">

| Tag | Description | Example
| --- | --- | ---
| `unstable` | the current code in the `master` branch, for testing purpose | `kosmorro/kosmorro:unstable`
| `latest` | the last version (equivalent to not specifying any tag) | `kosmorro/kosmorro:latest`
| `x` | the last version in the `x` major version | `kosmorro/kosmorro:0` will pull ![last version in the `0` major branch](https://img.shields.io/docker/v/kosmorro/kosmorro/0?style=flat-square)
| `x.y` | the last version in the `x.y` minor version | `kosmorro/kosmorro:0.10` will pull ![last version in the `0.10` minor branch](https://img.shields.io/docker/v/kosmorro/kosmorro/0.10?style=flat-square)
| `x.y.z` | the exact specified version | `kosmorro/kosmorro:0.10.0`

</div>

## Compile from sources

Compiling from the sources require:
- Git
- the `make` command
- Python 3
- PIP3
- the following Python packages:
    - `wheel` (needed to create the Python installable package)
    - `Babel` (to compile the translations)

All the sources are available [on GitHub](https://github.com/Kosmorro/kosmorro). If you prefer to build it from sources, clone the repository and check the tag of your choice out. Then compile the translations and the final package with the `i18n` and `build` recipes from the Makefile:

```bash
git clone https://github.com/Kosmorro/kosmorro && cd kosmorro
git checkout vx.y.z # replace "x.y.z" with the version
make i18n build
```