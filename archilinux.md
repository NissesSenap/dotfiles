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

## gnome

Aka show descktop, need to fix script for it...
Think this was default on fedora.

```bash
# Exists by default but no shortcut, this will override a default value
Hide all normal windows
super + d


open-filemanager
xdg-open .
super + e
```
