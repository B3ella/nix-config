# Personal NixOS Configuration

This repository contains my personal NixOS and Home Manager configuration. It is built as a Nix flake and manages both the system-level setup for a Linux machine and the user environment for my daily desktop workflow.

## What is included

- Declarative system configuration via `flake.nix`
- Home Manager configuration for the `bella` user
- Custom NixOS modules for peripherals, desktop tools, and services
- i3-based desktop setup with custom scripts and status widgets
- Developer environment tooling for Neovim, Git, Zsh, and terminal apps
- Support for apps such as Alacritty, qutebrowser, Docker, Steam, Syncthing, and Kanata

## Repository layout

```text
.
├── .github/
├── data/
├── public/
├── home/
│   └── bella/
│       ├── alacritty.nix
│       ├── default.nix
│       ├── git.nix
│       ├── i3.nix
│       ├── neovim.nix
│       ├── qute.nix
│       ├── scripts.nix
│       ├── status.nix
│       └── zsh.nix
├── hosts/
│   └── nixos/
│       ├── default.nix
│       └── hardware-configuration.nix
├── modules/
│   ├── bootloader.nix
│   ├── dev.nix
│   ├── docker.nix
│   ├── i3.nix
│   ├── kanata.nix
│   ├── locale.nix
│   ├── steam.nix
│   ├── syncthing.nix
│   └── ...
├── .gitignore
├── flake.lock
├── flake.nix
├── Readme.md
└── README.md
```

## Usage

This repo is intended for a NixOS machine with flakes enabled.

Clone it into `/etc/nixos` and rebuild:

```bash
sudo git clone https://github.com/B3ella/nix-config /etc/nixos
cd /etc/nixos
sudo nixos-rebuild switch --flake .
```

To apply the configuration at boot time instead:

```bash
sudo nixos-rebuild boot --flake .
reboot
```

## Notes

This is a personal configuration and may need adjustments to match your own machine, user name, hardware, or preferences. The structure is organized so host-specific settings live under `hosts/`, user configuration under `home/`, and reusable system behavior under `modules/`.

## License

This project does not currently declare a license in the repository metadata.
