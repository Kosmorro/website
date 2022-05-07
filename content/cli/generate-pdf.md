+++
title = "Kosmorro's PDF generator manual"
description = "All you need to know if you want to generate a PDF with Kosmorro"

[extra]
show_toc = true
+++

# Kosmorro's PDF generator

Kosmorro can export the computation results to PDF files that you can use for your obervation nights.
The PDF generator uses [LaTeX](https://fr.wikipedia.org/wiki/LaTeX), a language designed for high-quality documents composition.
This page explains how to use it.

## Prerequisites

Before you use Kosmorro's PDF generator, you will need to install a TeXLive distribution software:

- **on Linux**, TeXLive is usually available in your package manager repositories.
  - **On Debian** and derivatives, install the `texlive` and the `texlive-latex-extra` packages from your distribution's repository.
  - **On Arch Linux** and derivatives, install the `texlive-core` and `texlive-bin` packages from your _extra_ repositories.
- **on FreeBSD**, [install Kosmorro](@/cli/download/freebsd.md) with the `PDF=on` option.
- **on macOS**, install the basic version of [MacTeX](https://www.tug.org/mactex/), the port of TeXLive for Mac:
    - **with HomeBrew** (recommended): `brew install basictex`
    - **from the official website**: head to the [Smaller download](https://www.tug.org/mactex/morepackages.html) page and download and install the _BasicTeX.pkg_ package.

## How to export a PDF file

The PDF generator can be used simply by adding the following arguments to any Kosmorro command:

- **`--format=pdf`**: tells Kosmorro you want a PDF export
- **`--output={path}`**: tells Kosmorro where to save the PDF file

For instance, if you want to save a PDF file in `$HOME/Documents/observation_night.pdf` with the computation results for tomorrow in Lille, France, invoke the following command:

```bash
kosmorro \
    --date=+1d \
    --latitude=50.5824 \
    --longitude=3.0624 \
    --format=pdf \
    --output=$HOME/Documents/observation_night.pdf
```

Note that you can optionaly disable the graph generation with the `--no-graph` argument if you don't want it.
In this case, the ephemerides will be output in a simple table.

If the observation coordinates are missing, the PDF document will not contain the ephemerides section.

## Frequently Asked Questions

### I am getting a _Building PDF was not possible, because some dependencies are not installed_ error

Kosmorro uses the `pdflatex` command to generate the PDF document.

Check that you have installed TeXLive as explained in this page, and that the `pdflatex` command is in your `$PATH`:

- Try to invoke `which pdflatex`. If you are getting a _not found_ error, it means that TeXLive is not in your `$PATH`. Read your OS distribution's manual to fix this.
- Try to generate a test PDF from the [dumb LaTeX file](/downloads/dumb-pdf.zip): decompress the ZIP file, open a terminal in the extracted folder and invoke `pdflatex dumb.tex`

If the test PDF file is correctly generated, but you still cannot generate a PDF file, you are most likely facing a bug.
Please consider [opening an issue](https://github.com/Kosmorro/kosmorro/issues/new?assignees=&labels=bug&template=bug_report.md&title=Building+PDF+was+not+possible,+because+some+dependencies+are+not+installed) on GitHub, so we can investigate it.
