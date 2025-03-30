+++
title = "Download Kosmorro on Windows"
description = "All the instructions to install and use Kosmorro on Windows!"

template = "download.html"
+++

# Download Kosmorro on Windows

Kosmorro can run through the Windows Subsystem for Linux (WSL).  
Yup, that's cheating.

1. Download a Linux distribution (for instance, Debian) from the Windows Store.
2. Start Debian from the Start menu, and follow the configuration instructions in the terminal.
3. Open your `.bashrc` file:
   ```bash
   nano $HOME/.bashrc
   ```
   and add the following line at the end:
   ```bash
   export PATH="$HOME/.local/bin:$PATH"
   ```
   Finally, save and exit with Ctrl-O, Enter, Ctrl-X.
4. By default, Debian is in English. If you want to configure another language, see [this tutorial](https://www.shellhacks.com/linux-define-locale-language-settings/).
5. Install Python and pipx:
   ```bash
   sudo apt install python3 pipx
   ```
6. Quit Debian (`exit`) and restart to ensure the changes are taken in account.
7. Install Kosmorro:
   ```bash
   pipx install kosmorro
   ```