# Ansible Configuration for MacOS and Ubuntu 22.04

This project uses Ansible to configure MacOS and Ubuntu 22.04 devices with ZSH and CUDA.

## Requirements

- Ansible 2.9 or later
- MacOS or Ubuntu 22.04 device

## Project Structure

```bash
dotfiles/
├── inventory
├── ansible.cfg
├── macos.yml
├── ubuntu.yml
├── README.md
├── roles/
│   ├── macos/
│   │   ├── tasks/
│   │   │   ├── main.yml
│   └── ubuntu/
│   │   ├── tasks/
│   │   │   ├── main.yml
│   └── zsh/
│   │   ├── tasks/
│   │   │   ├── main.yml
│   │   ├── templates/
│   │   │   ├── zsh
│   └── cuda/
│   │   ├── tasks/
│   │   │   ├── main.yml
```


## Roles

- `macos`: Configures MacOS settings and installs MacOS-specific dependencies.
- `ubuntu`: Configures Ubuntu settings and installs Ubuntu-specific dependencies.
- `zsh`: Installs ZSH and sets up the `.zshrc` file.
- `cuda`: Installs CUDA toolkit for the NVIDIA GeForce 4070.

## Usage

- Clone this repository.
- Update the inventory file `inventory` with the IP addresses or hostnames of the devices you want to configure.

### Run for MacOS
Run the playbook for MacOS with the following command:
```bash
ansible-playbook -i inventory macos.yml
```

### Run for Ubuntu 22.04
Run the playbook for MacOS with the following command:
```bash
ansible-playbook -i inventory ubuntu.yml
```