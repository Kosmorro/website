+++
title = "Build Kosmorro from its source code"
description = "All the instructions to build Kosmorro!"
+++

# Build Kosmorro from its sources code

Building from the sources require:
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

## Looking to start contributing?

Kosmorro is a free (as in freedom) software, anyone can contribute to enhance Kosmorro.

Read the [contribution guide](https://github.com/Kosmorro/kosmorro/blob/master/CONTRIBUTING.md) on GitHub to get started!
