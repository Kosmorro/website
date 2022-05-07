+++
title = "Download Kosmorro on Linux"
description = "All the instructions to install Kosmorro on Linux!"

template = "download.html"
+++

# Download Kosmorro on macOS

macOS currently does not include Python 3 (only Python 2 is provided). The best and simplest method to install it is with [HomeBrew](https://brew.sh). Follow the installation instructions to get it, then install the `python` package from it. Once it is done, use PIP3 to install Kosmorro:

```bash
brew install python
pip3 install --user kosmorro
```

**Note:** if you get a "command not found" error when you try to run the `kosmorro` command, check that the `$HOME/.local/bin` is in your `$PATH`. This folder is a standard place to install applications locally, so this may be useful for many other apps.