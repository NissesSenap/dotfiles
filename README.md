# Install packages

Starting on my dotfiles journey.
This is a excellent blog if you also want to get [started](https://writingco.de/blog/how-i-manage-my-dotfiles-using-gnu-stow/)

```bash
sudo dnf install fedora-workstation-repositories
sudo dnf install vim-enhanced ansible stow zsh util-linux-user direnv kubernetes-client

# util-linux-user makes it possible to run chsh -s $(which zsh) to change default shell to zsh
```

## Disable gnome tabs

```bash
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"
gsettings set org.gnome.shell.window-switcher current-workspace-only "false"
```

## Disable revert mouse

```bash
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll false
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
```

## Fix shortcut

```bash
name="termite"
binding="<CTRL><ALT>t"
action="termite"

media_keys=org.gnome.settings-daemon.plugins.media-keys
custom_kbd=org.gnome.settings-daemon.plugins.media-keys.custom-keybinding
kbd_path=/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/$name/
new_bindings=`gsettings get $media_keys custom-keybindings | sed -e"s>'\]>','$kbd_path']>"| sed -e"s>@as \[\]>['$kbd_path']>"`
gsettings set $media_keys custom-keybindings "$new_bindings"
gsettings set $custom_kbd:$kbd_path name $name
gsettings set $custom_kbd:$kbd_path binding $binding
gsettings set $custom_kbd:$kbd_path command $action
```

## Flickering screen on asus laptop

```bash
cat /etc/X11/xorg.conf.d/20-amdgpu.conf 
Section "Device"
     Identifier "Intel Graphics"
     Driver "intel"
     Option "TearFree" "true"
EndSection
```

## Brave browser

```bash
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser
```

## Flatpack

```bash
# vscode
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.visualstudio.code

# slack
flatpak install flathub com.slack.Slack

# spotify
flatpak install flathub com.spotify.Client
```

## termite

```bash
dnf copr enable skidnik/termite
dnf install termite
```

## zsh

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended`

## TODO

- Turn stuff in to ansible when reasonable
- Auto install vscode extensions

### Applications

- instal golang
- manage all your favorite cli:s...
  - kubectl
  - etc

## Commands

### sudoers

sudo sh -c "echo \"$USER ALL=(ALL) NOPASSWD:ALL\" > /etc/sudoers.d/01_me"

### run the script

```bash
# Remove the .bashrc so we can stow it.
sudo rm .bashrc
sudo setup.sh
rm .bashrc
setup.sh
```

### Random command

Commands I never use and need to remember...

`git submodule add https://github.com/zsh-users/zsh-syntax-highlighting.git zsh/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting`
