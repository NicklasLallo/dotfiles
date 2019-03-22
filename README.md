# ❤ Dotfiles ❤
My current dotfiles. Could be yours as well.  

Uses GNU Stow to symlink the dotfiles. You can easily pick and choose the parts you like without having to use everything.  

Instructions:  
1. Clone the repo into your home folder, ex: `~/dotfiles`.
2. Install GNU Stow. (or do the symlinks manualy, see: `man ln`
4. Backup any of your original config files you want to keep around.
3. Go to the repo and run `stow vim` or similar to symlink the files asociated with that part of the setup.

## Some details
+ **OS**: Arch
+ **WM**: i3
+ **Terminal**: kitty
+ **Shell**: zsh
+ **File Manager**: Thunar for GUI, Ranger for terminal
+ **Launcher**: Rofi
+ **Editor**: Vim (main) & Spacemacs

## Updated view:
![2019 Preview of Setup](https://i.imgur.com/yLiOPFK.png)

## Older picture:
![Preview of Setup](https://i.imgur.com/tewk8oJ.png)

## Custom keybinds
### i3
Mostly defauly keybindings I believe. For more information check out the i3 config file.
+ `super + enter` - Launch Kitty running zsh
+ `super + Shift + enter` - Launch Kitty running ranger
+ `super + d` - Launch Rofi
+ `super + hjkl` - Move focus with vim-keys

### vim
A lot of custom settings, mostly documented inside `.vimrc`.
+ TODO

### tmux
+ TODO

## Wallpapers
+ TODO

## Scripts & Aliases
+ `bm` (**b**ook**m**ark) - Appends the current working directory (path) into a file in your home directory. If passed aadditional text it will append that as a comment on the line in the file. I use this to bookmark all my most commonly visited locations in the file system.
+ `cdb` (**cd** **b**ookmark) - Opens the file of bookmarks from your home directory, passes the lines to [fzf](https://github.com/junegunn/fzf), allows you to fuzzy search select a bookmark based on path or comment, and then changes your current directory to that location.
+ `fshow` - Git commit browser. `enter` for show, `Ctrl-d` for diff, \` toggles sort.
+ Various git log FZF scripts, see the `.zshrc` file for more details. , `
+ `Ctrl+r`, `Ctrl+t`, `Alt+c` - Default fzf behaviour.
+ `Ctrl+f` - fzf fuzzy search for file recursively down from current location, opens selection for editing in vim.
+ `cdd` - `cd ~/dotfiles`
+ `cdf` - cd to the directory of fzf fuzzy find filename.
+ `fkill` - fzf search all processes you have permission to kill, SIGTERM the selection.
+ `l` - `ls -lah`
+ `:e` - `vim`
+ `:q` - `exit`

## Misc software recomendations.

- CLI
    - [Zsh](https://github.com/zsh-users/zsh) - A shell similar to bash.
    - [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) - An open source, community-driven framework for managing your Zsh configuration.
    - [Bash](https://git.savannah.gnu.org/cgit/bash.git) - A Unix shell and command language.
    - [tmux](https://github.com/tmux/tmux) - A terminal multiplexer.
    - [Neovim](https://github.com/neovim/neovim) - Vim-fork focused on extensibility and usability.
    - [htop](https://github.com/hishamhm/htop) - Better than top.
    - [fzf](https://github.com/junegunn/fzf) - A command-line fuzzy finder.
    - [Ag](https://github.com/BurntSushi/ripgrep) - A line-oriented search tool that recursively searches directories for a regex pattern. Simiar to Grep, but faster.
    - [Nerd-Fonts](https://github.com/ryanoasis/nerd-fonts) - Patch fonts with a lot of extra symbols for use in terminal and more.
- GUI
    - [i3-gaps](https://github.com/Airblader/i3) - i3 fork with additional settings for spacing around/between windows. 
    - [Rofi](https://github.com/DaveDavenport/rofi) - A window switcher, application launcher and dmenu replacement.
    - [Compton](https://github.com/tryone144/compton) (Fork) - A compositor for X11. Allows for transparency and blur.
    - [Arc Theme](https://github.com/NicoHood/arc-theme) (Fork) - A flat theme with transparent elements for GTK 3, GTK 2, and GNOME Shell.
    - misc tamsyn - font used in polybar
    - Wuncon Siji - font used in polybar
