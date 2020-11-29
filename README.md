# Install packages

Starting on my dotfiles journey.
This is a excellent blog if you also want to get started
https://writingco.de/blog/how-i-manage-my-dotfiles-using-gnu-stow/

```bash
sudo dnf install fedora-workstation-repositories
sudo dnf install vim-enhanced ansible stow zsh util-linux-user direnv kubernetes-client

# util-linux-user makes it possible to run chsh -s $(which zsh) to change default shell to zsh
```

## Disable gnome tabs
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"
gsettings set org.gnome.shell.window-switcher current-workspace-only "false"

## Disable revert mouse
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll false
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false

## Flickering screen on asus laptop
cat /etc/X11/xorg.conf.d/20-amdgpu.conf 
Section "Device"
     Identifier "Intel Graphics"
     Driver "intel"
     Option "TearFree" "true"
EndSection

## Brave browser
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser

## Flatpack
sudo flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install flathub com.visualstudio.code

## zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended


## TODO

- Enable me to run sudo without password

### Applications 

- instal golang
- manage all your favorite cli:s...
  - kubectl
  - etc
