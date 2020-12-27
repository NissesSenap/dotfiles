# arch

All this is now managed by ansible

## Packages
sudo pacman -Sy fakeroot binutils go make gcc git stow vim termite code patch ansible

Yay makes it easier to install AUR packages

```bash
# This is now managed by ansible
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

## Ansible

[ansible-aur](https://github.com/kewlfft/ansible-aur) is a submodule that I use to manage aur packages.

Found a simple role for [yay](https://github.com/jonsible/yay) but it was so small
so there was no reason to just not take the code instead of creating a seperate role.
