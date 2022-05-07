+++
title = "Download Kosmorro on Linux"
description = "All the instructions to install Kosmorro on Linux!"

template = "download.html"
+++

# Download Kosmorro on Linux

## Arch Linux

Kosmorro is available [on the AUR](https://aur.archlinux.org/packages/kosmorro)! To install it, use your favorite AUR helper:

```bash
yay kosmorro
```

## Other Linux distributions

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