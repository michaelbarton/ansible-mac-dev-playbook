# Ansible Setup for new OSX

Provision and set up a new Mac computer using ansible.

## Manual steps

- [Create ssh key for github][ssh_key]
- Remap capslock to ctrl.

[ssh_key]: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

## Setup

Run the commands:

```console
make install
```

This will install prerequisites (Xcode CLI tools, Rosetta on Apple Silicon), fetch Ansible dependencies, and run the playbook.

## Running specific tasks

Specific tasks can be run with `--tags`:

```console
uv run ansible-playbook playbook.yml --tags osx --ask-become-pass
```

Available tags:

- `dotfiles` — Clone/update the dotfiles repository
- `homebrew` — Install Homebrew packages and cask applications
- `osx` — Apply macOS system defaults
- `dock` — Configure Dock items
- `cleanup` — Upgrade and clean up Homebrew packages (requires `-e homebrew_upgrade=true`)

## Upgrading Homebrew packages

Homebrew upgrade and cleanup are opt-in to keep regular runs fast:

```console
uv run ansible-playbook playbook.yml --tags cleanup -e homebrew_upgrade=true --ask-become-pass
```

## Dry run

Preview changes without applying them:

```console
uv run ansible-playbook playbook.yml --check --ask-become-pass
```

## Links

- [MacOS setup automation using a bootstrap script and Ansible](https://wilsonmar.github.io/ansible-mac-osx-setup/)
- [geerlingguy/mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook)
- [TalkingQuickly/ansible-osx-setup](https://github.com/TalkingQuickly/ansible-osx-setup)
