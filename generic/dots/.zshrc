# Make a simple prompt for dumb terminals (fixes emacs' problem logging into remotes with zsh)
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/hamish/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=powerlevel10k/powerlevel10k

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh




#################
#    ALIASES    #
#################
alias oldvim=vim
alias vim=nvim
alias -g cdu='cd ~/src/useful-scripts/'
alias tem='emacsclient -nw'
alias sdn='shutdown now'
alias rsn='shutdown -r now'
alias p3='python3'
alias p2='python2'
alias sshpi='ssh -Y pi@10.0.0.75'
alias sshwork='ssh -Y hamish@10.0.0.73'
alias pm='pulsemixer'
alias tm='tmux attach || tmux'
alias d2p="pwd | sed 's/datasets/processed/g'"
alias p2d="pwd | sed 's/processed/datasets/g'"
alias b2s="pwd | sed 's/build/src/g'"
alias s2b="pwd | sed 's/src/build/g'"
alias l='ls -l'
alias ll='ls -la'
alias activate-metashape='~/src/garbage/metashape-pro/metashape.sh --activate ADFXV-42BN8-M7VAR-9AOGY-NGKE6'
alias deactivate-metashape='~/src/garbage/metashape-pro/metashape.sh --deactivate'
alias mnt_pond='abyss-mount-share hmo rhino-pond /mnt/pond'
alias mnt_tank='abyss-mount-share hmo rhino-tank /mnt/tank'

#################
#    EXPORTS    #
#################
path+=('/home/hamish/.local/bin')
path+=('/home/hamish/src/useful-scripts/generic')
path+=('/home/hamish/src/useful-scripts/arch-desktop')
export PATH

export EDITOR="/bin/nvim"

export MPD_HOST="localhost"
export MPD_PORT="6600"

# this should start emacs if the daemon is not already running
export ALTERNATE_EDITOR=""

# Fix colours in tmux
export TERM=xterm-256color
