# My dotfiles

## Usage

1. Clone to `~/dotfiles`: `git clone --bare https://github.com/puttehi/dotfiles $HOME/dotfiles`
2. Afterwards substitute `git` with: `git --git-dir=$HOME/dotfiles --work-tree=$HOME' <any normal git command>`

> `.bashrc` should already have this set as an alias: `alias dotgit='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'`

Install the NerdFont ([LICENSE](https://github.com/ryanoasis/nerd-fonts/blob/master/LICENSE)) in your system, and change it in the terminal emulator (`.local/share/fonts/FiraMonoNerdFontMono-Medium.ttf`).

## Troubleshooting

### Missing tools?

If you have not installed most of the tools yet, you might want to run `~/install-basic-tools.sh` before you re-source the .bashrc to get at least most of the tools it expects.

Most troublesome ones might be `zoxide` (super `cd`), and `oh-my-posh` (prompt).

### Git repo itself trying to be tracked (`--git-dir`)?

```sh
echo dotfiles >> $HOME/.gitignore
```

### Can't commit due to `EDITOR` errors with git?

Update `.gitconfig` to use a different editor.
