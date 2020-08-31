# Dotfiles
The dotfiles git repo is set up following this guide https://martijnvos.dev/using-a-bare-git-repository-to-store-linux-dotfiles/

## Changes outside the home folder
I did some changes outside the HOME folder, that I have not tracked here. I'Il mention the ones I am likely to redo below.

### Disable the system "beep"
Add this line to `/etc/inputrc`
```shell
set bell-style none
```

### Configure the keyboard during login
After login the keyboard layout is set by [gxkb](https://github.com/aksell/dotfiles/blob/master/.config/gxkb/gxkb.cfg), but before login the layout is set following the manjaro wikis [guide for changing your keyboard layout permanently](https://wiki.manjaro.org/index.php/Keyboard_Layout).
Contents of: `/etc/X11/xorg.conf.d/00-keyboard.conf`
```shell
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "us,no"
        Option "XkbModel" "pc105"
        Option "XkbVariant" "colemak,"
        Option "XkbOption" "grp:ctrl_alt_toggle,ctrl:nocaps"
EndSection
``` 

