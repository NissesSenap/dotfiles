# Install packages

Starting on my dotfiles journey.
This is a excellent blog if you also want to get [started](https://writingco.de/blog/how-i-manage-my-dotfiles-using-gnu-stow/)

Then I add some ansible sprincle on the top

## submodules

git submodule update --init --recursive

## Install

### Fedora

```bash
dnf install ansible

# Needed for flatpack config
ansible-galaxy collection install community.general

```

#### termite

Copr isn't supported in ansible...

```bash
dnf copr enable skidnik/termite
dnf install termite
```


### Arche

```bash
pacman -S ansible
```

### sudoers

sudo sh -c "echo \"$USER ALL=(ALL) NOPASSWD:ALL\" >> /etc/sudoers"

### Run playbook

ansible-playbook playbook.yml


### zsh

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended`

### run the script

Run code before starting the script. Else we will get intresting linking stuff.

```bash
# Remove the .bashrc so we can stow it.
sudo rm .bashrc
sudo setup.sh
rm .bashrc .zshrc
setup.sh
```

## Manual tasks

Some tasks was a pain to do with ansible...

## Gnome settings

### Disable gnome tabs

```bash
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"
gsettings set org.gnome.shell.window-switcher current-workspace-only "false"
```

### Disable revert mouse

```bash
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll false
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
```

### Fix shortcut

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

## Brave browser

```bash
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser
```

## TODO

- Turn stuff in to ansible when reasonable
- Auto install vscode extensions


### VScode

There is today no easy way to manage extensions using git but there is a sync-option that is in preview but i don't want to use it...
Instead my plan is to write a simple script that I will run from time to time to keep my extensions updated.

```bash
# Create the backup
code --list-extensions > vscode-extensions.list
# To install on a new client
cat vscode-extensions.list | xargs -L 1 code --install-extension

```

### Applications

- instal golang
- manage all your favorite cli:s...
  - kubectl
  - etc

## Commands

### Random command

Commands I never use and need to remember...

`git submodule add https://github.com/zsh-users/zsh-syntax-highlighting.git zsh/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting`
