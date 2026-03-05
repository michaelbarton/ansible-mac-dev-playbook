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

This will install prerequisites (Xcode CLI tools, Rosetta on Apple Silicon), fetch Ansible dependencies, and run the playbook. Specific tasks can be run with `--tags`:

```console
uv run ansible-playbook osx_defaults.yml --tags osx --ask-become-pass
```

## Links

- [MacOS setup automation using a bootstrap script and Ansible](https://wilsonmar.github.io/ansible-mac-osx-setup/)
- [geerlingguy/mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook)
- [TalkingQuickly/ansible-osx-setup](https://github.com/TalkingQuickly/ansible-osx-setup)
