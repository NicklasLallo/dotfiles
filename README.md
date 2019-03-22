# ❤ Dotfiles ❤
My current dotfiles. Could be yours as well.  

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

## Instructions:  
You can easily pick and choose the parts you like without having to use everything. Each folder is named after a package and contains every configuration file used by that application. The files inside the folders are relative to home (e.g. the file `vim/.vimrc` goes to `~/.vimrc`).

To more quickly set things up I recomend to use GNU Stow to symlink the dotfiles. 
1. Clone the repo into your home folder, e.g. `~/dotfiles`.
2. Install stow from your package manager. (or do the symlinks manualy, see: `man ln`)
4. Backup any of your original config files you want to keep around.
3. Go to the repo and run `stow vim` or similar to symlink the files asociated with that part of the setup.

## Considerations
My setup uses two monitors, one of which is an ultrawide monitor with higher than usual (1080p) resolution. If you use this on any other system you will have to manualy tweak the positioning of the polybar segments. This is not difficult, simple math should suffice. Same with the gaps/borders, they are most likely to large on for example only a single 1080p or 720p monitor.

Many of the dotfiles require additional software/plugins or such that aren't imediately obvious, for example extra fonts, or other programs that don't require their own dotfiles, I have tried to document those in this file but I will have most likely missed one or more of them. Example:
+ ranger is using ranger_devicons
+ zsh was for a while running with powerline (but it is now using a customized spaceship instead)

## Custom keybinds
### i3
Mostly defauly keybindings I believe. For more information check out the i3 config file.
+ `super + enter` - Launch Kitty running zsh
+ `super + Shift + enter` - Launch Kitty running ranger
+ `super + d` - Launch Rofi
+ `super + hjkl` - Move focus with vim-keys
+ `super + n` - run pywal, automatically select a new random wallpaper from `~/wallpapers/inuse`, generate new colorthemes for polybar, kitty, and much more, and automatically tell those applications to update (polybar restarts quietly). This is also done on each restart.

### vim
A lot of custom settings, mostly documented inside `.vimrc`.
+ TODO

### tmux
+ TODO

## Wallpapers
The wallpaper is set with feh in the i3 configuration, as startup command.
+ 
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
    - [pywal](https://github.com/dylanaraps/pywal) - Generate and change color-schemes on the fly. Change the wallpaper and the theme of most applications to match.
    - [Rofi](https://github.com/DaveDavenport/rofi) - A window switcher, application launcher and dmenu replacement.
    - [Compton](https://github.com/tryone144/compton) (Fork) - A compositor for X11. Allows for transparency and blur.
    - [Arc Theme](https://github.com/NicoHood/arc-theme) (Fork) - A flat theme with transparent elements for GTK 3, GTK 2, and GNOME Shell.
    - misc tamsyn - font used in polybar
    - Wuncon Siji - font used in polybar
    - [Redshift](https://github.com/jonls/redshift) - Redshift adjusts the color temperature of your screen according to your surroundings. The lightbulb icon of the polybar lanches it and displays the current temperature.

##Contributing
I'm open to discuss suggestions, & changes. Feel free to send me a pull requests or message.
