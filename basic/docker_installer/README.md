# Docker Installation Script

This script automates the installation of Docker and Docker Compose on various Linux distributions. It detects the operating system, updates repositories, installs required dependencies, and then installs Docker and Docker Compose.

## Usage

1. Make the script executable:
   ```bash
   chmod +x docker_installer.sh

2. Run the script
   ```bash
   ./docker_installer.sh

## Script Explanation
The script performs the following steps:

1. Displays an ASCII art.
2. Detects the operating system (Debian/Ubuntu/Linux Mint or Red Hat/CentOS/Fedora).
3. Updates repositories and installs necessary dependencies.
4. Installs Docker if it's not already installed.
5. Adds the current user to the "docker" group for running Docker commands without sudo.
6. Installs Docker Compose if it's not already installed.
7. Displays the installed versions of Docker and Docker Compose.
8. Displays a final message based on the installation status.

## Supported Operating Systems
The script supports the following operating systems:

- Debian
- Ubuntu
- Linux Mint
- Red Hat
- CentOS
- Fedora

## Note
Depending on your system and privileges, you might need to restart the session or the system after adding the user to the "docker" group to apply changes.

Make sure you understand the implications of running scripts with elevated privileges. Always review the script content before execution.