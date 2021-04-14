# Manage multiple kubeconfig

Due to that where I work have multiple kubernetes customers on different azure subscriptions
I'm using direnv to automatically set different kubeconfig files.

For more info see [XenitAB/xenit-computer-configuration](https://github.com/XenitAB/xenit-computer-configuration/tree/master/configuration).

The following files have something to do with this:

- direnv contains the template that is used in the different folders.
- .zsh contains a few functions to manage this config easily.
- setup-xenit.sh is used during the initial setup and you don't ever have to run it again.
