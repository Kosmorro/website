+++
title = "Kosmorrolib - a library to calculate your ephemerides"
description = "Kosmorro's calculation logic, for the developers."
+++

# ![Kosmorrolib](/img/svg/kosmorro/kosmorrolib-logo-white.svg) <small>A library to compute your ephemerides</small>

Kosmorrolib is the Python library internally used in Kosmorro. It provides easy-to-use functions for your calculation needs.

The library is built on [Skyfield](https://rhodesmill.org/skyfield/), an excellent library designed to compute _"positions for the stars, planets, and satellites in orbit around the Earth"_.

## Install the library

Kosmorrolib is currently available in the version {{ lib_version() }} and needs Python 3.7+ to work.

The library is available [on PyPI](https://pypi.org/project/kosmorrolib/), so you can install it directly with PIP:

```bash
pip install kosmorrolib
```

Note that Kosmorrolib follows the [Semantic versionning v2](https://semver.org/spec/v2.0.0.html) specification.

## Update the library

Updating the Kosmorrolib to the latest version is as simple as running the following command:

```bash
pip update kosmorrolib
```

Before updating, you may want to check the [changelog](@/lib/changelog.md) to know what changed since the previous version.

## Documentation

The documentation of the library is available [just here](/lib/doc/).
