# Ansible Setup for new OSX

Provision and set up a new Mac computer using ansible.

## Manual steps

- [Create ssh key for github][ssh_key]
- Remap capslock to ctrl.

[ssh_key]: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

## Setup

Run the commands:

- ./bin/bootstrap
- ./bin/apply

The first will install ansible on the system. Then the second will execute the ansible playbook. A specific commands can be run with `--tags`.

```console
./bin/apply --tags osx
```

## Links

- [MacOS setup automation using a bootstrap script and Ansible](https://wilsonmar.github.io/ansible-mac-osx-setup/)
- [geerlingguy/mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook)
- [TalkingQuickly/ansible-osx-setup](https://github.com/TalkingQuickly/ansible-osx-setup)
