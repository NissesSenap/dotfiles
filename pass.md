# pass

## gpg2 getting started

Generate the gpg key and follow the instructions.

gpg2 --full-gen-key

### list keys

gpg2 --list-keys

## pass get started

Will generate a 21 carachter password

pass generate -c Internet/github.com/NissesSenap 21

### show folder structure

pass show

### show password

pass show Internet/github.com/NissesSenap

### set password

Will prompt you to add the password

pass insert -e /Internet/randomPage

### set anything

```bash
pass insert -m torolol
Enter contents of torolol and press Ctrl+D when finished:

wee
Password: foo
```

### edit a password

pass edit torolol

## browserpass

https://github.com/browserpass/browserpass-extension#installation

On arch all you need is a package for your browser.
Ether browserpass-chromium or browserpass-firefox and it will setup the gpg socket server on your laptop as well.

### organazing your store

You need to think on how you save the data in your pass store for browerpass to be able to find it.

https://github.com/browserpass/browserpass-extension#organizing-password-store
