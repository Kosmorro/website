+++
title = "Download Kosmorro on Linux"
description = "All the instructions to install Kosmorro on Linux!"

template = "download.html"
+++

# Download Kosmorro on Linux

## Debian, Ubuntu, Linux Mint...

Kosmorro is available on our own repository. To install it, you will first need to add it to your APT sources:

```bash
# First, add Kosmorro's repositories to your APT sources:
echo "deb [arch=all] https://pkg.kosmorro.space/apt main main" | sudo tee /etc/apt/sources.list.d/kosmorro.list
# Then, add the repository public key:
curl -fsSL https://kosmorro.space/apt.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/kosmorro.gpg
```

Finally, install Kosmorro with your favorite package manager:

```bash
sudo apt install kosmorro
```

## Arch Linux

Kosmorro is available [on the AUR](https://aur.archlinux.org/packages/kosmorro)! To install it, use your favorite AUR helper:

```bash
yay kosmorro
```

## Other Linux distributions

For other distributions, the recommended way to install Kosmorro is using [`pipx`](https://pipx.pypa.io):

```bash
pipx install kosmorro
```
