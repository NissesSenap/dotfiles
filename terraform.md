# terraform

## tfenv

There is a terraform bin switcher/downloader.
To install manually on arch do: `yay -S tfenv`

To download a ceartain version and use it

```bash
tfenv install 1.1.7
tfenv use 1.1.7
```

### fedora

```shell
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
ln -s ~/.tfenv/bin/* ~/.local/bin
```
