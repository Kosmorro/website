+++
title = "Download Kosmorro"
description = "All the instructions to install Kosmorro, depending on your platform!"
+++

# Download Kosmorro

Kosmorro is currently available on the platforms listed bellow.

- [Linux](#linux)
- [FreeBSD](#freebsd)
- [macOS](#macos) (_deprecated_)
- [Compile from sources](#compile-from-sources)

If you want to generate a PDF file, you might want to look at its [dedicated documentation](@/cli/generate-pdf.md) too.

You might also want to [read the manpage](@/cli/manpage.md) to know how to use Kosmorro's command line program.

## Linux

### Arch Linux

Kosmorro is available [on the AUR](https://aur.archlinux.org/packages/kosmorro)! To install it, use your favorite AUR helper:

```bash
yay kosmorro
```

### Other Linux distributions

If you don't use Arch (btw), two options are available for you:

- Download [the AppImage file](/cli/download/kosmorro-latest-x86_64.AppImage), give it the execution rights and run it:
  ```bash
  curl -o $HOME/.local/bin/kosmorro.AppImage \
       https://kosmorro.space/cli/download/kosmorro-latest-x86_64.AppImage
  chmod +x $HOME/.local/bin/kosmorro.AppImage

  # Run the application:
  kosmorro.AppImage
  ```

- Otherwise, you can install on your system: install Python 3 and PIP package manager, then use PIP to install Kosmorro.

  For instance, on Debian:

  ```bash
  sudo apt install python3 python3-pip
  pip3 install --user kosmorro

  # Run the application:
  kosmorro
  ```

**Note:** if you get a "command not found" error when you try to run the `kosmorro` command, check that the `$HOME/.local/bin` is in your `$PATH`. This folder is a standard place to install applications locally, so this may be useful for many other apps.

## FreeBSD

Kosmorro is available in [your official repositories](https://www.freshports.org/astro/kosmorro)! You can install it directly with your package manager:

```bash
pkg install kosmorro

# Run the application:
kosmorro
```

## macOS

macOS currently does not include Python 3 (only Python 2 is provided). The best and simplest method to install it is with [HomeBrew](https://brew.sh). Follow the installation instructions to get it, then install the `python` package from it. Once it is done, use PIP3 to install Kosmorro:

```bash
brew install python
pip3 install --user kosmorro

# Run the application:
kosmorro
```

**Note:** if you get a "command not found" error when you try to run the `kosmorro` command, check that the `$HOME/.local/bin` is in your `$PATH`. This folder is a standard place to install applications locally, so this may be useful for many other apps.

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
