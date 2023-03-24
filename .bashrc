# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

### zoxide ###
# Enable zoxide
export PATH="/home/putte/.local/bin:$PATH"
eval "$(zoxide init bash --cmd=c)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

### vim ###
# Always vim
alias vi=vim

### oh-my-posh ###
# Enable oh my posh
#__OH_MY_POSH_THEME_FILE__=jandedobbeleer.omp.json
# THEME TODOS:
# Add all used tools, now only python and tf - TF, NODE, GIT at least OK
# Migrate to powerline so color changes don't break the prompt so bad and no need for exit hacks - TRIED but undoable before full templating is available.. Must use diamond in beginning of "path" which leaves a ugly-ass trailing diamond..
__OH_MY_POSH_THEME_FILE__=putte.omp.json
eval "$(oh-my-posh --init --shell bash --config ~/.poshthemes/$__OH_MY_POSH_THEME_FILE__)"

## Dotdrop alias
#alias dotdrop=~/dotfiles/dotdrop.sh --cfg=~/dotfiles/config.yaml
# NOTE: Seems to be deprecated? Maybe?

# shorter cd ..
alias ..="cd .."

### fzf ###
# New way of activating fzf keybinding it seems
source /usr/share/doc/fzf/examples/key-bindings.bash

### Dotdrop ###
alias dotdrop="~/dev/repos/dotfiles/dotdrop.sh"

### Steam Proton appdata memo for dummies ###
alias protonappdata="~/protonappdata.sh"

### bat-cat ###
# make bat-cat replace cat (syntax highlighting)
alias cat="bat -p --no-pager"
# use bat-cat as man pager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# highlight --help messages (cp --help) using bat
alias bathelp='bat --plain --language=help'
bhelp() {
    "$@" --help 2>&1 | bathelp
}

### fd-find ###
# Seemed to be manually installed already, so aliasing it to the usual
alias fd="fdfind --hidden"

### ripgrep rg ###
alias rg="rg --hidden"

### fzf hacks ###
# Use bat for previewing files on the side
# Use ctrl+f to move down, ctrl+b to move up like unix usually has f and b
FZF_CTRL_T_OPTS="\
    --preview 'bat --style=numbers,header,snip --color=always --line-range :500 {}' \
    --preview-window 'right,60%,border-left,+{2}+3/3,~3' \
    --bind \"ctrl-f:preview-down,ctrl-b:preview-up,ctrl-v:execute(vim {} &> /dev/tty)+refresh-preview,ctrl-g:execute(codium -r {})+abort\""
# Alternative from docs (loses fuzziness, good or no?) -> no:
# https://github.com/junegunn/fzf/blob/master/ADVANCED.md#using-fzf-as-interative-ripgrep-launcher

# Use fd as the default source (without pipe)
export FZF_DEFAULT_COMMAND='fd --type f --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

### nvm (node version manager) ###
# Exported by installer:
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### tldr (fast to digest man pages) ###
# Use bat for tldr
#_NVM_TLDR_PATH="/home/puttehi/.nvm/versions/node/v18.4.0/bin/tldr"
#DEBUG: ls /home/puttehi/.nvm/versions/node/v18.4.0/bin
btldr() {
    nvm exec --silent 18 tldr "$@" 2>&1 | bat --plain --no-pager --language=help
}
alias bt="btldr"

### poetry shell alias ###
alias _pav="poetry shell"

### Sensible tree default ###
alias tree="tree -L 1 -a"

### Greeting ###
source $HOME/greeting.sh

export PATH="/home/$USER/bin:$PATH"

# Flatpak Protontricks
alias protontricks="flatpak run com.github.Matoking.protontricks"

# Go binaries from `go install`
export PATH="$PATH:$HOME/go/bin"

# Dotfiles git alias
alias dotgit='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
