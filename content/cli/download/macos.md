+++
title = "Download Kosmorro on macOS"
description = "All the instructions to install Kosmorro on macOS!"

template = "download.html"
+++

# Download Kosmorro on macOS

## With [Homebrew](https://brew.sh)

Kosmorro is available in its own Tap. First, you will have to tell Homebrew to subscribe to it:

```bash
brew tap kosmorro/tap
```

Now, you can install Kosmorro like any other package:

```bash
brew install kosmorro
```

## With `pipx`

macOS may not have the last version of Python. The best and simplest method to install it is with [Homebrew](https://brew.sh):

```bash
brew install python
```

Then, use [`pipx`](https://pipx.pypa.io) to install Kosmorro:

```bash
pipx install kosmorro
```
