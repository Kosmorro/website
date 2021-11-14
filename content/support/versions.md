+++
title = "Versions support"
description = "All you need to know about how the versions of Kosmorro and Kosmorrolib are supported."
+++

# Version support

Because Kosmorro and Kosmorrolib are two specific projects that don't have the same goal, they don't benefit of the same kind of version support.

This page gives all the details you need on how are supported the versions of both projects.

## Kosmorro <small class="last_version"><strong>Last version:</strong> {{ cli_version() }}</small> {#kosmorro}

For Kosmorro, the command line program, only the last version is supported.

If you are not sure of what version of Kosmorro you are running, invoke `kosmorro --version`, and upgrade if needed.

## Kosmorrolib <small class="last_version"><strong>Last version:</strong> {{ lib_version() }}</small> {#kosmorrolib}

For Kosmorrolib, the library that actually makes the calculations, the last patch of the two last minor versions are supported.
Therefore, once a new minor version of Kosmorrolib is released, you have some time to upgrade before it comes to End-of-Life.

<aside class="center">

{{ version_support() }}

</aside>

### Backward Compatibility Promise

Kosmorrolib versioning follows the [Semantic Versioning 2.0.0](https://semver.org/) specification, so each minor version keeps backward compatibility (BC) of the features. Any BC-break in a minor version _must_ be treated as a bug. See [the support](@/support/_index.md) page for more information about how to report it.

When it is possible, any BC break that can be anticipated in the next major release will be preceded by a deprecation in a minor version, that are listed in the [Changelog](@/lib/changelog.md) for each version.
